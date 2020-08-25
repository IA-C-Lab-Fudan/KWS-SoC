#include <stdio.h>
#include "drv_usart.h"
#include "VS1053.h"



#define KWS_DATA_IN_BADDR 0x40010000
#define KWS_WEIGHT_IN_BADDR 0x40020000
#define KWS_CONTROL_IN_BADDR 0x40100000
#define KWS_DATA_OUT_BADDR  0x80000000

#define WEIGHT_BADDR 0x30000000


extern void mdelay(uint32_t ms);
extern void KWS_IRQHandler(void);
extern void drv_irq_register(uint32_t irq_num, void *irq_handler);
extern void drv_irq_enable(uint32_t irq_num);


void kws_intr(void)
{
	float read_results_kws[12];
	float tmp;
	u8 max_idx;
	
	//read results

	//kws data out , the first 48 set of resuts is invalid.
	for(int j=0; j<12; j++)
	{
		read_results_kws[j] = *(volatile float *) 0x80000000;
	}

		
										
	//标签判断
	tmp = read_results_kws[0];
	max_idx = 0;
	for (int i=0 ; i<11 ; i++)
	{
		if (read_results_kws[i+1] > tmp)
		{
			tmp = read_results_kws[i+1];
			max_idx = i+1;
		}					
	}
			
	
	switch(max_idx)
	{
		case 0 : printf("The result is _silence_.\n");break;
		case 1 : printf("The result is _unknown_.\n");break;
		case 2 : printf("The result is yes.\n");break;
		case 3 : printf("The result is no.\n");break;
		case 4 : printf("The result is up.\n");break;
		case 5 : printf("The result is down.\n");break;
		case 6 : printf("The result is left.\n");break;
		case 7 : printf("The result is right.\n");break;
		case 8 : printf("The result is on.\n");break;
		case 9 : printf("The result is off.\n");break;
		case 10: printf("The result is stop.\n");break;
		case 11 :printf("The result is go.\n");break;
		default : printf("error\n");break;
	}

	*(volatile uint32_t *) 0x40100000 = 0x1;
		
		
}

void initialize_kws()
{
	float tmp;
	u32 tmp1;
	u16 recoder_buff[1700];
	u16 write_time;
	//wight in
	*(volatile uint32_t *) 0x40100000 = 0x0;
		
	for (int i=0;i<746; i++)
	{
		tmp = *(float *) (WEIGHT_BADDR+4*i);
		*(volatile float *) 0x40010000 = tmp;
	}
	
	for (int i=0;i<8970; i++)
	{
		tmp1 = *(u32 *) (WEIGHT_BADDR+4*746+4*i);
		*(volatile u32 *) 0x40020000 = tmp1;

	}
	printf("Start initializing, please keep quite.\n");
	vs1053_record_start();
	mdelay(2000);
	while(1)
	{
		vs1053_record_run_kws(recoder_buff ,&write_time);

							
		if (write_time >= 1600)
		{
			break;
		}
	}
	VS_HD_Reset();		   	//硬复位
	VS_Soft_Reset();  		//软复位  
	for(int i=0;i<3200;i++)
	{
		*(volatile float *)0x40010000 = (float)(*(short *) &recoder_buff[i]);
	}
}

int main(void)
{
	drv_irq_register(45, KWS_IRQHandler);
	drv_irq_enable(45);
	

	VS_Init();
	//printf("vs1053:%4X\n",VS_Ram_Test());
	VS_Sine_Test();	
	VS_HD_Reset();
	VS_Soft_Reset();
	
	initialize_kws();
	
	printf("Initialize done\n");
	
	*(volatile uint32_t *) 0x40100000 = 0x1;
	
	vs1053_record_start();
	mdelay(2000);
	printf("Start speaking.\n");
	while(1)
	{
		vs1053_record_run_kws_fifo();
	}
		
	VS_HD_Reset();		   	//硬复位
	VS_Soft_Reset();  		//软复位  
			
		

	return 0;
}