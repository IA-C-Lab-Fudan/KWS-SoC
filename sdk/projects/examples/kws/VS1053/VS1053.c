#include "VS1053.h"

gpio_pin_handle_t pin_VS_XCS = NULL;
gpio_pin_handle_t pin_VS_XDCS = NULL;
gpio_pin_handle_t pin_VS_DREQ = NULL;
gpio_pin_handle_t pin_VS_RST = NULL;
spi_handle_t spi_VS = NULL;

static uint8_t receive_buff;
static uint8_t VS_WRITE_COMMAND = 0x02;
static uint8_t VS_READ_COMMAND = 0x03;

extern void mdelay(uint32_t ms);

///////////////////////////usart initialize for song transfer//////////////////////////////////////
static usart_handle_t usart = NULL;
static spi_handle_t spi_PC = NULL;

static void spi_event_cb_fun(int32_t idx, spi_event_e event)
{
    //printf("\nspi_event_cb_fun:%d\n",event);
}

static int32_t usart_receive_sync(usart_handle_t usart, void *data, uint32_t num)
{
    int time_out = 0xfffffff;
    usart_status_t status;

    csi_usart_receive(usart, data, num);

    while (time_out) {
        time_out--;
        status = csi_usart_get_status(usart);

        if (!status.rx_busy) {
            break;
        }
    }

    if (0 == time_out) {
        return -1;
    }

    return 0;
}

void initialize_usart(void)
{
	usart = csi_usart_initialize(0, NULL);
	csi_usart_config(usart, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

}

void initialize_spi_pc(void)
{
	spi_PC = csi_spi_initialize(1, spi_event_cb_fun);
	csi_spi_config(spi_PC, 1000000  , SPI_MODE_MASTER,
					SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB,
					SPI_SS_MASTER_SW, 8);
}
////////////////////////////////////////////////////////////////////////////////////////////////////


//VS1053默认设置参数
_vs1053_obj vsset=
{
	220,	//音量:220
	6,		//低音上线 60Hz
	15,		//低音提升 15dB	
	10,		//高音下限 10Khz	
	15,		//高音提升 10.5dB
	0,		//空间效果	
};

_recorder_obj recoder_set=
{
	0,						//输入通道选择.0：MICP，1：LINE1
	1,			//采样速率选择（x*8K）：1：8K，2：16K，3：24K...
	2,					//声道：1：双声道，2：左声道，3：右声道
	2,						//增益：1~64
};

int spi_receive_data(spi_handle_t handle, void *data, uint32_t num)
{
	spi_status_t status;
	csi_spi_receive(handle, data, num);
	

    while (1) {
        status = csi_spi_get_status(handle);

        if (status.busy == 0) {
            break;
        }
    }
	
	return 0;
}



/////////////////////////////////////////
bool VS_DREQ_IN(void)
{	
	bool pin_value;
	csi_gpio_pin_read(pin_VS_DREQ,&pin_value);
	return pin_value;
}

void VS_XDCS_SET(void)
{	
	csi_gpio_pin_write(pin_VS_XDCS,1);
}

void VS_XDCS_CLR(void)
{	
	csi_gpio_pin_write(pin_VS_XDCS,0);
}

void VS_XCS_SET(void)
{	
	csi_gpio_pin_write(pin_VS_XCS,1);
}

void VS_XCS_CLR(void)
{	
	csi_gpio_pin_write(pin_VS_XCS,0);
}

void VS_RST_SET(void)
{	
	csi_gpio_pin_write(pin_VS_RST,1);
}

void VS_RST_CLR(void)
{	
	csi_gpio_pin_write(pin_VS_RST,0);
}

void VS_SPI_ReadWriteByte(u8 data_out, void *data_in)
{
	csi_spi_transfer(spi_VS, &data_out, data_in, 1, 1);

    while (csi_spi_get_status(spi_VS).busy);
	
}

void VS_SPI_ReadWriteByte_s(void* data_out, void *data_in)
{
	csi_spi_transfer(spi_VS, data_out, data_in, 1, 1);

    while (csi_spi_get_status(spi_VS).busy);
	
}
//////////////////////////////////////////////////////////////

void VS_SPI_SpeedLow(void)
{								 
	if(csi_spi_config_baudrate(spi_VS, 2500000)!=0)//设置到低速模式
		printf("error\n");
 
}

void VS_SPI_SpeedHigh(void)
{						  
	if(csi_spi_config_baudrate(spi_VS, 10000000)!=0)//设置到高速模式	
		printf("error\n");
}
/////////////////////////////////////////////////////////////



//初始化VS1053的IO口	 
void VS_Init(void)
{
	pin_VS_XCS = csi_gpio_pin_initialize(VS_XCS,NULL);
	pin_VS_XDCS = csi_gpio_pin_initialize(VS_XDCS,NULL);
	pin_VS_DREQ = csi_gpio_pin_initialize(VS_DREQ,NULL);
	pin_VS_RST  = csi_gpio_pin_initialize(VS_RST,NULL);
	
	csi_gpio_pin_config(pin_VS_XCS,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_config(pin_VS_XDCS,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_config(pin_VS_DREQ,GPIO_MODE_PULLUP,GPIO_DIRECTION_INPUT);
	csi_gpio_pin_config(pin_VS_RST,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	
	spi_VS = csi_spi_initialize(2, spi_event_cb_fun);
	csi_spi_config(spi_VS, 400000  , SPI_MODE_MASTER,
					SPI_FORMAT_CPOL1_CPHA1, SPI_ORDER_MSB2LSB,
					SPI_SS_MASTER_SW, 8);
	
	VS_XDCS_SET();//取消数据传输
	VS_XCS_SET();//取消数据传输
	VS_RST_SET();	 
	mdelay(1);
	VS_SPI_ReadWriteByte(0xff,&receive_buff);//启动传输	
	
}

/////////////////////////////////basic function/////////////////////////////////
//向VS1053写命令
//address:命令地址
//data:命令数据
void VS_WR_Cmd(u8 address,u16 data)
{  
	u8 data_h = data>>8;
	u8 data_l = data & 0x00ff;
	while(VS_DREQ_IN()==0);//等待空闲		  
	VS_SPI_SpeedLow();//低速 	   
	VS_XDCS_SET(); 
	VS_XCS_CLR();	 
	VS_SPI_ReadWriteByte(VS_WRITE_COMMAND,&receive_buff);//发送VS10XX的写命令
	VS_SPI_ReadWriteByte(address,&receive_buff); 	//地址
	VS_SPI_ReadWriteByte(data_h,&receive_buff); 	//发送高八位
	VS_SPI_ReadWriteByte(data_l,&receive_buff);	 	//低八位
	VS_XCS_SET();           
	VS_SPI_SpeedHigh();				//高速	   
} 
//向VS10XX写数据
//data:要写入的数据
void VS_WR_Data(u8 data)
{
	VS_SPI_SpeedHigh();//高速,对VS1003B,最大值不能超过36.864/4Mhz，这里设置为9M 
	VS_XDCS_CLR();   
	VS_SPI_ReadWriteByte(data,&receive_buff);
	VS_XDCS_SET();      
}         
//读VS10XX的寄存器           
//address：寄存器地址
//返回值：读到的值
//注意不要用倍速读取,会出错
u16 VS_RD_Reg(u8 address)
{ 
	u16 temp;
	u16 temp1;
	while(VS_DREQ_IN()==0);//非等待空闲状态 		  
	VS_SPI_SpeedLow();//低速 
	VS_XDCS_SET();       
	VS_XCS_CLR();      
	VS_SPI_ReadWriteByte(VS_READ_COMMAND,&receive_buff);	//发送VS10XX的读命令
	VS_SPI_ReadWriteByte(address,&receive_buff);       	//地址
	VS_SPI_ReadWriteByte(0xff,&temp); 		//读取高字节
	temp=temp<<8;
	VS_SPI_ReadWriteByte(0xff,&temp1); 		//读取低字节
	temp = temp + temp1;
	VS_XCS_SET();     
	VS_SPI_SpeedHigh();//高速	  
   return temp; 
}  
//读取VS10xx的RAM
//addr：RAM地址
//返回值：读到的值
u16 VS_WRAM_Read(u16 addr) 
{ 
	u16 res;			   	  
 	VS_WR_Cmd(SPI_WRAMADDR, addr); 
	res=VS_RD_Reg(SPI_WRAM);  
 	return res;
} 
//写VS10xx的RAM
//addr：RAM地址
//val:要写入的值 
void VS_WRAM_Write(u16 addr,u16 val) 
{  		   	  
 	VS_WR_Cmd(SPI_WRAMADDR,addr);	//写RAM地址 
	while(VS_DREQ_IN()==0); 				//等待空闲	   
	VS_WR_Cmd(SPI_WRAM,val); 		//写RAM值 
} 
//设置播放速度（仅VS1053有效） 
//t:0,1,正常速度;2,2倍速度;3,3倍速度;4,4倍速;以此类推
void VS_Set_Speed(u8 t)
{
	VS_WRAM_Write(0X1E04,t);		//写入播放速度 
}
//FOR WAV HEAD0 :0X7761 HEAD1:0X7665    
//FOR MIDI HEAD0 :other info HEAD1:0X4D54
//FOR WMA HEAD0 :data speed HEAD1:0X574D
//FOR MP3 HEAD0 :data speed HEAD1:ID
//比特率预定值,阶层III
const u16 bitrate[2][16]=
{ 
{0,8,16,24,32,40,48,56,64,80,96,112,128,144,160,0}, 
{0,32,40,48,56,64,80,96,112,128,160,192,224,256,320,0}
};
//返回Kbps的大小
//返回值：得到的码率
u16 VS_Get_HeadInfo(void)
{
	unsigned int HEAD0;
	unsigned int HEAD1;  
 	HEAD0=VS_RD_Reg(SPI_HDAT0); 
  HEAD1=VS_RD_Reg(SPI_HDAT1);
  //printf("(H0,H1):%x,%x\n",HEAD0,HEAD1);
	switch(HEAD1)
	{        
			case 0x7665://WAV格式
			case 0X4D54://MIDI格式 
			case 0X4154://AAC_ADTS
			case 0X4144://AAC_ADIF
			case 0X4D34://AAC_MP4/M4A
			case 0X4F67://OGG
			case 0X574D://WMA格式
			case 0X664C://FLAC格式
			{
					//printf("HEAD0:%d\n",HEAD0);
					HEAD1=HEAD0*2/25;//相当于*8/100
					if((HEAD1%10)>5)return HEAD1/10+1;//对小数点第一位四舍五入
					else return HEAD1/10;
			}
			default://MP3格式,仅做了阶层III的表
			{
					HEAD1>>=3;
					HEAD1=HEAD1&0x03; 
					if(HEAD1==3)HEAD1=1;
					else HEAD1=0;
					return bitrate[HEAD1][HEAD0>>12];
			}
	}  
}
//得到平均字节数
//返回值：平均字节数速度
u32 VS_Get_ByteRate(void)
{
	return VS_WRAM_Read(0X1E05);//平均位速
}
//得到需要填充的数字
//返回值:需要填充的数字
u16 VS_Get_EndFillByte(void)
{
	return VS_WRAM_Read(0X1E06);//填充字节
}  


////////////////////////////////////////////////////////////////////////////////	 	  
//软复位VS10XX
void VS_Soft_Reset(void)
{	 
	u8 retry=0;  				   
	while(VS_DREQ_IN()==0); 					//等待软件复位结束	   
	VS_SPI_ReadWriteByte(0xff,&receive_buff);		//启动传输
	retry=0;
	while(VS_RD_Reg(SPI_MODE)!=0x0800)	// 软件复位,新模式  
	{
		VS_WR_Cmd(SPI_MODE,0x0804);		// 软件复位,新模式	    
		mdelay(2);//等待至少1.35ms 
		if(retry++>100)break; 	    
	}	 		 
	while(VS_DREQ_IN()==0);//等待软件复位结束	 
	retry=0;
	while(VS_RD_Reg(SPI_CLOCKF)!=0X9800)//设置VS1053的时钟,3倍频 ,1.5xADD 
	{
		VS_WR_Cmd(SPI_CLOCKF,0X9800);	//设置VS1053的时钟,3倍频 ,1.5xADD
		if(retry++>100)break; 	    
	}	 
	mdelay(20);
}
//硬复位MP3
//返回1:复位失败;0:复位成功	   
u8 VS_HD_Reset(void)
{
	u8 retry=0;
	VS_RST_CLR();
	mdelay(20);
	VS_XDCS_SET();//取消数据传输
	VS_XCS_SET();//取消数据传输
	VS_RST_SET();	   
	while(VS_DREQ_IN()==0&&retry<200)//等待DREQ为高
	{
		retry++;
		mdelay(1);
	};
	mdelay(20);	
	if(retry>=200)return 1;
	else return 0;	    		 
}

u16 VS_Ram_Test(void)
{ 
	VS_HD_Reset();     
 	VS_WR_Cmd(SPI_MODE,0x0820);// 进入VS10XX的测试模式
	while (VS_DREQ_IN()==0); // 等待DREQ为高
	mdelay(1);
 	VS_SPI_SpeedLow();//低速 
	VS_XDCS_CLR();  		    // xDCS = 0，选择VS10XX的数据接口
	VS_SPI_ReadWriteByte(0x4d,&receive_buff);
	VS_SPI_ReadWriteByte(0xea,&receive_buff);
	VS_SPI_ReadWriteByte(0x6d,&receive_buff);
	VS_SPI_ReadWriteByte(0x54,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	mdelay(150);  
	VS_XDCS_SET();
	return VS_RD_Reg(SPI_HDAT0);// VS1053如果得到的值为0x83FF，则表明完好;   
}
//正弦测试 
void VS_Sine_Test(void)
{											    
	VS_HD_Reset();	 
	VS_WR_Cmd(0x0b,0X2020);	  //设置音量
 	VS_WR_Cmd(SPI_MODE,0x0820);//进入VS10XX的测试模式     
	while(VS_DREQ_IN()==0);     //等待DREQ为高
	mdelay(1);
	//printf("mode sin:%x\n",VS_RD_Reg(SPI_MODE));
 	//向VS1053发送正弦测试命令：0x53 0xef 0x6e n 0x00 0x00 0x00 0x00
 	//其中n = 0x24, 设定VS1053所产生的正弦波的频率值，具体计算方法见VS1053的datasheet
	VS_SPI_SpeedLow();//低速 
	VS_XDCS_CLR();//选中数据传输
	VS_SPI_ReadWriteByte(0x53,&receive_buff);
	VS_SPI_ReadWriteByte(0xef,&receive_buff);
	VS_SPI_ReadWriteByte(0x6e,&receive_buff);
	VS_SPI_ReadWriteByte(0x24,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	VS_XDCS_SET();
	mdelay(100);
   //退出正弦测试
    VS_XDCS_CLR();//选中数据传输
	VS_SPI_ReadWriteByte(0x45,&receive_buff);
	VS_SPI_ReadWriteByte(0x78,&receive_buff);
	VS_SPI_ReadWriteByte(0x69,&receive_buff);
	VS_SPI_ReadWriteByte(0x74,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	VS_SPI_ReadWriteByte(0x00,&receive_buff);
	mdelay(100);
	VS_XDCS_SET();		 
}	 

//发送一次音频数据
//固定为32字节
//返回值:0,发送成功
//		 1,VS10xx不缺数据,本次数据未成功发送    
u8 VS_Send_MusicData(u8* buf)
{
	u8 n;
	if(VS_DREQ_IN()!=0)  //送数据给VS10XX
	{			   	 
		VS_XDCS_CLR();  
        for(n=0;n<32;n++)
		{
			VS_SPI_ReadWriteByte(buf[n],&receive_buff);	 			
		}
		VS_XDCS_SET();     				   
	}else return 1;
	return 0;//成功发送了
}



//切歌
//通过此函数切歌，不会出现切换“噪声”				
void VS_Restart_Play(void)
{
	u16 temp;
	u16 i;
	u8 n;	  
	u8 vsbuf[32];
	for(n=0;n<32;n++)vsbuf[n]=0;//清零
	temp=VS_RD_Reg(SPI_MODE);	//读取SPI_MODE的内容
	temp|=1<<3;					//设置SM_CANCEL位
	temp|=1<<2;					//设置SM_LAYER12位,允许播放MP1,MP2
	VS_WR_Cmd(SPI_MODE,temp);	//设置取消当前解码指令
	for(i=0;i<2048;)			//发送2048个0,期间读取SM_CANCEL位.如果为0,则表示已经取消了当前解码
	{
		if(VS_Send_MusicData(vsbuf)==0)//每发送32个字节后检测一次
		{
			i+=32;						//发送了32个字节
   			temp=VS_RD_Reg(SPI_MODE);	//读取SPI_MODE的内容
 			if((temp&(1<<3))==0)break;	//成功取消了
		}	
	}
	if(i<2048)//SM_CANCEL正常
	{
		temp=VS_Get_EndFillByte()&0xff;//读取填充字节
		for(n=0;n<32;n++)vsbuf[n]=temp;//填充字节放入数组
		for(i=0;i<2052;)
		{
			if(VS_Send_MusicData(vsbuf)==0)i+=32;//填充	  
		}   	
	}else VS_Soft_Reset();  	//SM_CANCEL不成功,坏情况,需要软复位 	  
	temp=VS_RD_Reg(SPI_HDAT0); 
    temp+=VS_RD_Reg(SPI_HDAT1);
	if(temp)					//软复位,还是没有成功取消,放杀手锏,硬复位
	{
		VS_HD_Reset();		   	//硬复位
		VS_Soft_Reset();  		//软复位 
	} 
}

//重设解码时间                          
void VS_Reset_DecodeTime(void)
{
	VS_WR_Cmd(SPI_DECODE_TIME,0x0000);
	VS_WR_Cmd(SPI_DECODE_TIME,0x0000);//操作两次
}
//得到mp3的播放时间n sec
//返回值：解码时长
u16 VS_Get_DecodeTime(void)
{ 		
	u16 dt=0;	 
	dt=VS_RD_Reg(SPI_DECODE_TIME);      
 	return dt;
} 	    					  

//vs10xx装载patch.
//patch：patch首地址
//len：patch长度
void VS_Load_Patch(u16 *patch,u16 len) 
{
	u16 i; 
	u16 addr, n, val; 	  			   
	for(i=0;i<len;) 
	{ 
		addr = patch[i++]; 
		n    = patch[i++]; 
		if(n & 0x8000U) //RLE run, replicate n samples 
		{ 
			n  &= 0x7FFF; 
			val = patch[i++]; 
			while(n--)VS_WR_Cmd(addr, val);  
		}else //copy run, copy n sample 
		{ 
			while(n--) 
			{ 
				val = patch[i++]; 
				VS_WR_Cmd(addr, val); 
			} 
		} 
	} 	
} 		  	  

//设定VS10XX播放的音量和高低音
//volx:音量大小(0~254)
void VS_Set_Vol(u8 volx)
{
    u16 volt=0; 			//暂存音量值
    volt=254-volx;			//取反一下,得到最大值,表示最大的表示 
	volt<<=8;
    volt+=254-volx;			//得到音量设置后大小
    VS_WR_Cmd(SPI_VOL,volt);//设音量 
}

//设定高低音控制
//bfreq:低频上限频率	2~15(单位:10Hz)
//bass:低频增益			0~15(单位:1dB)
//tfreq:高频下限频率 	1~15(单位:Khz)
//treble:高频增益  	 	0~15(单位:1.5dB,小于9的时候为负数)
void VS_Set_Bass(u8 bfreq,u8 bass,u8 tfreq,u8 treble)
{
    u16 bass_set=0; //暂存音调寄存器值
    signed char temp=0;   	 
	if(treble==0)temp=0;	   		//变换
	else if(treble>8)temp=treble-8;
 	else temp=treble-9;  
	bass_set=temp&0X0F;				//高音设定
	bass_set<<=4;
	bass_set+=tfreq&0xf;			//高音下限频率
	bass_set<<=4;
	bass_set+=bass&0xf;				//低音设定
	bass_set<<=4;
	bass_set+=bfreq&0xf;			//低音上限    
	VS_WR_Cmd(SPI_BASS,bass_set);	//BASS 
}

//设定音效
//eft:0,关闭;1,最小;2,中等;3,最大.
void VS_Set_Effect(u8 eft)
{
	u16 temp;	 
	temp=VS_RD_Reg(SPI_MODE);	//读取SPI_MODE的内容
	if(eft&0X01)temp|=1<<4;		//设定LO
	else temp&=~(1<<5);			//取消LO
	if(eft&0X02)temp|=1<<7;		//设定HO
	else temp&=~(1<<7);			//取消HO						   
	VS_WR_Cmd(SPI_MODE,temp);	//设定模式    
}	 


///////////////////////////////////////////////////////////////////////////////
//设置音量,音效等.
void VS_Set_All(void) 				
{			 
	VS_Set_Vol(vsset.mvol);			//设置音量
	VS_Set_Bass(vsset.bflimit,vsset.bass,vsset.tflimit,vsset.treble);  
	VS_Set_Effect(vsset.effect);	//设置空间效果
}
/*--------------  以上是VS1053驱动部分 -------------------------*/



void vs1053_player_song_init(void)
{		
	//VS_Restart_Play();  			
	VS_Set_All();
	VS_Reset_DecodeTime();
	

	VS_SPI_SpeedHigh();	
	mdelay(1);
}

void vs1053_player_song_datain(uint8_t *buffer)
{
	uint16_t i=0;
	do
	{  	
		if(VS_Send_MusicData(buffer+i)==0)
		{
			i+=32;
		}
	}while(i<BUFSIZE);
}

void vs1053_player_song()
{	
	uint8_t song_buff[BUFSIZE];
	
	vs1053_player_song_init();
	initialize_usart();
	while(1)
	{
		if(0 == usart_receive_sync(usart,song_buff,BUFSIZE))
		{
			vs1053_player_song_datain(song_buff);
		}
	}

	//spi transfer
	/*		uint8_t head[2];
	initialize_spi_pc();
	while(1)
	{	
		if(0 == spi_receive_data(spi_PC,&head,2))
		{
			mdelay(1);
			;
			if(head == 0x8c)
			{
				if(0 == spi_receive_data(spi_PC,song_buff,BUFSIZE))
				{
					mdelay(10);
					vs1053_player_song_datain(song_buff);
				}
			}
			
		}
	}*/
}

void vs1053_player_song_test()
{	
	uint8_t song_buff[32768] = {0};
	
	vs1053_player_song_init();
	initialize_usart();
	
	for (int i =0 ; i<31; i++)
	{
		usart_receive_sync(usart, &song_buff[i*1024], 1024);
	}
	
	usart_receive_sync(usart, &song_buff[31744], 300);
	
	printf("start playing\n");
	vs1053_player_song_datain(song_buff);
	
	
}

/*----------------- 录音功能函数 --------------------------*/
static uint16_t write_time;
static __WaveHeader wavhead;


//VS1053的WAV录音有bug,这个plugin可以修正这个问题 							    
const uint16_t wav_plugin[40]=/* Compressed plugin */ 
{ 
0x0007, 0x0001, 0x8010, 0x0006, 0x001c, 0x3e12, 0xb817, 0x3e14, /* 0 */ 
0xf812, 0x3e01, 0xb811, 0x0007, 0x9717, 0x0020, 0xffd2, 0x0030, /* 8 */ 
0x11d1, 0x3111, 0x8024, 0x3704, 0xc024, 0x3b81, 0x8024, 0x3101, /* 10 */ 
0x8024, 0x3b81, 0x8024, 0x3f04, 0xc024, 0x2808, 0x4800, 0x36f1, /* 18 */ 
0x9811, 0x0007, 0x0001, 0x8028, 0x0006, 0x0002, 0x2a00, 0x040e,  
}; 

//激活PCM 录音模式
//agc:0,自动增益.1024相当于1倍,512相当于0.5倍,最大值65535=64倍		  
void recoder_enter_rec_mode(_recorder_obj *recset)
{
	//如果是IMA ADPCM,采样率计算公式如下:
 	//采样率=CLKI/256*d;	
	//假设d=0,并2倍频,外部晶振为12.288M.那么Fc=(2*12288000)/256*6=16Khz
	//如果是线性PCM,采样率直接就写采样值 
    VS_WR_Cmd(SPI_BASS,0x0000);    
 	VS_WR_Cmd(SPI_AICTRL0,recset->samplerate*8000);	//设置采样率
 	VS_WR_Cmd(SPI_AICTRL1,recset->agc*1024);		//设置增益,0,自动增益.1024相当于1倍,512相当于0.5倍,最大值65535=64倍	
 	VS_WR_Cmd(SPI_AICTRL2,0);		//设置增益最大值,0,代表最大值65536=64X
 	VS_WR_Cmd(SPI_AICTRL3,4+recset->channel);		//4：线性PCM模式 + 2： 左通道 3： 右通道
	VS_WR_Cmd(SPI_CLOCKF,0X2000);	//设置VS10XX的时钟,MULT:2倍频;ADD:不允许;CLK:12.288Mhz
	VS_WR_Cmd(SPI_MODE,0x1804|(recset->input<<14));		//MIC,录音激活    
 	mdelay(5);					//等待至少1.35ms 
 	VS_Load_Patch((u16*)wav_plugin,40);//VS1053的WAV录音需要patch
}



void vs1053_record_start(void)    //录音开始
{	
	VS_HD_Reset();	
	VS_Soft_Reset();      
	recoder_enter_rec_mode(&recoder_set);  	
	VS_SPI_SpeedHigh();	
	while(VS_RD_Reg(SPI_HDAT1)>>8);			//等到buf 较为空闲再开始    
}

void vs1053_record_run(u8 *VS1053_Mem)        //记录一次音频数据，建议33ms左右执行一次
{    
	uint16_t regval;    
	uint16_t idx;    
	regval=VS_RD_Reg(SPI_HDAT1);		
	if((regval>=256)&&(regval<896))     
	{          
		idx=0;            
		while(idx<512)        
			{        
				regval=VS_RD_Reg(SPI_HDAT0);		
				VS1053_Mem[write_time]=regval&0XFF;		
				VS1053_Mem[write_time+1]=regval>>8;  		
				idx+=2;          
				write_time+=2; 
			}              
	}
}

int vs1053_record_run_kws(u16 *VS1053_Mem ,u16 *count)        //记录一次音频数据，建议33ms左右执行一次
{    
	uint16_t regval;    
	uint16_t idx;    
	regval=VS_RD_Reg(SPI_HDAT1);		
	if((regval>=read_threshold)&&(regval<896))     
	{ 
		idx=0;            
		while(idx<read_threshold)        
			{        
				regval=VS_RD_Reg(SPI_HDAT0);		
				VS1053_Mem[*count]=regval;
				idx = idx+1;
				*count = *count + 1;

			} 
		return 0;
	}

	else return 1;
	
}

int vs1053_record_run_kws_fifo(void)        //记录一次音频数据，建议33ms左右执行一次
{    
	uint16_t regval;    
	uint16_t idx;    
	regval=VS_RD_Reg(SPI_HDAT1);		
	if((regval>=read_threshold)&&(regval<896))     
	{ 
		idx=0;            
		while(idx<read_threshold)        
			{        
				regval=VS_RD_Reg(SPI_HDAT0);		
				*(volatile float *)0x40010000=(float)(*(short *) &regval);
				idx = idx+1;
			} 
		return 0;
	}

	else return 1;
	
}



void vs1053_record_stop(void)
{
			
    VS_HD_Reset();		   	//硬复位
    VS_Soft_Reset();  		//软复位  
	
	wavhead.riff.ChunkID=0X46464952;	//"RIFF"
	wavhead.riff.ChunkSize=write_time+36;			//还未确定,最后需要计算
	wavhead.riff.Format=0X45564157; 	//"WAVE"
	wavhead.fmt.ChunkID=0X20746D66; 	//"fmt "
	wavhead.fmt.ChunkSize=16; 			//大小为16个字节
	wavhead.fmt.AudioFormat=0X01; 		//0X01,表示PCM;0X01,表示IMA ADPCM
 	wavhead.fmt.NumOfChannels=1;		//单声道
 	wavhead.fmt.SampleRate=recoder_set.samplerate *  8000;		//8Khz采样率 采样速率
 	wavhead.fmt.ByteRate=wavhead.fmt.SampleRate*2;//16位,即2个字节
 	wavhead.fmt.BlockAlign=2;			//块大小,2个字节为一个块
 	wavhead.fmt.BitsPerSample=16;		//16位PCM
    wavhead.data.ChunkID=0X61746164;	//"data"
 	wavhead.data.ChunkSize=write_time;			//数据大小,还需要计算  
	
}

void recorder_run()
{
	printf("Start recording...\n");
	mdelay(500);

	while(1)
	{
		vs1053_record_run(wavhead.data.recoder_buff);
		if(write_time>test_size)
			break;
	}

	vs1053_record_stop();
	printf("start playing...\n");
	
	vs1053_player_song_init();
	uint16_t i=0;
	
	mdelay(1000);
	do
	{  	
		if(VS_Send_MusicData((u8*)(&wavhead)+i)==0)
		{
			i+=32;
		}
	}while(i<test_size+60);
	
	printf("Play Done\n");
	
	
	
}