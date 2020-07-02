//注意载入数据流不能反，要先cosines后datain;<-与IP中一致

#include <stdio.h>
#include "drv_usart.h"
#include "drv_timer.h"

#define PRPROCESS_DATA_IN_BADDR  0x40200000;
#define COSINES_BADDR  0x40300000;
#define PREPROCESS_CONTROL_IN_BADDR  0x70000000;
#define PRPROCESS_DATA_OUT_BADDR  0x78000000;

#define KWS_DATA_IN_BADDR 0x40010000
#define KWS_WEIGHT_IN_BADDR 0x40020000
#define KWS_CONTROL_IN_BADDR 0x40100000
#define KWS_DATA_OUT_BADDR  0x80000000
#define KWS_KEEP_IN_BADDR 0x10000000

#define COSINES_MEM_BADDR 0x30000000
#define WEIGHT_IN_BADDR 0x30001040

#define INPUTGROUP 40
#define NUMPERGROUP 400

static usart_handle_t usart = NULL;
static uint8_t data_in[NUMPERGROUP*4] ;
static int count;
static uint32_t datain_tmp;


static int32_t usart_receive_sync(usart_handle_t usart, void *data, uint32_t num)
{
    usart_status_t status;

    csi_usart_receive(usart, data, num);

    while (1) {
        status = csi_usart_get_status(usart);

        if (!status.rx_busy) {
            break;
        }
    }

    return 0;
}




void initialize_usart()
{
	usart = csi_usart_initialize(0, NULL);
	csi_usart_config(usart, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

}


void initialize_preprocess()
{	
	float tmp;
	//cosines in
	for(int i=0; i<1040; i++)
	{	tmp = *(float *) (COSINES_MEM_BADDR+4*i);
		*(volatile float *) 0x40300000 = tmp;
	}

}

void initialize_kws()
{
	float tmp;
	//wight in
	for (int i=0;i<35879; i++)
	{
		tmp = *(float *) (WEIGHT_IN_BADDR+4*i);
		*(volatile float *) 0x40020000 = tmp;
	}
}


int main()
{
	float read_data_preprocess[490];
	float read_results_kws[12];
	
	timer_handle_t timer_handle;
	uint32_t start_value;
	uint32_t stop_value;
	
	
	printf("start!\n");
	timer_handle = csi_timer_initialize(0, NULL);
	csi_timer_config(timer_handle, TIMER_MODE_FREE_RUNNING);
	
	
	initialize_usart();
	
	*(volatile uint32_t *) 0x70000000 = 0x0;
	*(volatile uint32_t *) 0x40100000 = 0x0;
	
	initialize_preprocess();
	initialize_kws();

	while(1)
	{	
		if(0 == usart_receive_sync(usart, data_in, NUMPERGROUP*4))
		{
			for (int i=0;i<NUMPERGROUP;i++)
			{
				datain_tmp = data_in[i*4]<<24 | data_in[i*4+1]<<16 | data_in[i*4+2]<<8 | data_in[i*4+3];
				*(volatile float *) 0x40200000 = *(float *)&datain_tmp;
			}	
			count++;
		}
		
		if(count==40)
		{
			csi_timer_start(timer_handle);
			csi_timer_get_current_value(timer_handle, &start_value);
	
			*(volatile uint32_t *) 0x70000000 = 0x1;
	
			for(int j=0; j<490; j++)
			{
				read_data_preprocess[j] = *(volatile float *) PRPROCESS_DATA_OUT_BADDR;
			}
			
			*(volatile uint32_t *) 0x40100000 = 0x1;
			
			//preprocess output
            /*for(int i=0;i<49;i++)
			{
				for(int j=0; j<10; j++)
				{
					printf("%.6f\t",(float)read_data_preprocess[10*i+j]);
				}
					printf("\n");
			}*/
			
			// kws data in
			for (int i=0 ; i<49; i++)
			{
				for(int j=0; j<10; j++)
				{
					*(volatile float *) 0x40010000 = read_data_preprocess[i*10+j];
				}
				if(i==0)
				{
					*(volatile float *) 0x10000000 = 0;
				}
				else
				{
					*(volatile float *) 0x10000000 = 1;
				}
				
				//kws data out , the first 48 set of resuts is invalid.
				for(int j=0; j<12; j++)
				{
					read_results_kws[j] = *(volatile float *) 0x80000000;
				}
				
				*(volatile uint32_t *) 0x40100000 = 0x1;
			}
			csi_timer_get_current_value(timer_handle, &stop_value);
						
			
			for (int i=0; i<12 ;i++)
				printf("%.5f\n",read_results_kws[i]);
				
			printf("Kws running time:%.6fs\n",(float)(start_value-stop_value)/20e6);
			
			//此处重新输入cosines，为下次输入做准备
			
			count = 0;
			*(volatile uint32_t *) 0x70000000 = 0x0;
			initialize_preprocess();

			
			printf("Ready for the next set of data.\n");
	
		}
	}
	
	return 0;
}
	
