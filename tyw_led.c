#include "tyw_led.h"
#include  	"init.h"

unsigned char  led_duty_cycles[LED_MATRIX_NUM_PINS][LED_MATRIX_NUM_PINS]={0};   //LED_MATRIX_NUM_PINS=8

unsigned char  led_duty_cycles_tmp[LED_MATRIX_NUM_PINS]={0};

void* tyw_memset(void* ptr, uint8_t value, uint8_t num) 
{
    uint8_t* p = (uint8_t*)ptr;
    uint8_t i=0;
    for ( i = 0; i < num; i++) 
    {
        *(p+i) = (uint8_t)value;
    }
    return ptr;
}

void* tyw_memcpy(void* dest, const void* src, uint8_t num) 
{
    uint8_t i=0;
    uint8_t* d = (uint8_t*)dest;
    const uint8_t* s = (const uint8_t*)src;
    for ( i = 0; i < num; i++) {
        d[i] = s[i];
    }
    return dest;
}


#define ROWS 18
#define COLS 3
const uint8_t ledShowIndex[ROWS][COLS][2] =
{ 
    {{1,2},{1,3},{1,4}},
    {{1,5},{1,6},{1,7}},
    {{2,1},{2,3},{2,4}},
    {{2,5},{2,6},{2,7}},
    {{3,1},{3,2},{3,4}},
    {{3,5},{3,6},{3,7}},
    {{4,1},{4,2},{4,3}},
    {{4,5},{4,6},{4,7}},
    {{5,1},{5,2},{5,3}},
    {{5,4},{5,6},{5,7}},
    {{6,1},{6,2},{6,3}},
    {{6,4},{6,5},{6,7}},
    {{7,1},{7,2},{7,3}},
    {{7,4},{7,5},{7,6}},
    {{8,1},{8,2},{8,3}},
    {{8,4},{8,5},{8,6}},
    {{1,8},{2,8},{0,0}}, 
    {{8,7},{0,0},{0,0}},   
};



void led_matrix_run(void)     
{
    static unsigned char  row = 0;
    uint8_t x = 0, y = 0;

    uint8_t rowCount = 0;

    for (rowCount = 0; rowCount < LED_MATRIX_NUM_PINS; rowCount++)
    {
        led_set_io_od(rowCount);    //全设置为高阻   
    }
    
    for (rowCount = 0; rowCount < COLS; rowCount++)
    {

        if (ledShowIndex[row][rowCount][0] == 0)  // 如果 LED 显示索引的第一维数组中的值为0，则跳出循环，因为是从led1开始
            break;

        x = ledShowIndex[row][rowCount][0] - 1;     // 获取 LED 显示索引中的 x 和 y 坐标
        y = ledShowIndex[row][rowCount][1] - 1;
       
        if(led_duty_cycles[x][y])
        {
            led_set_io_pp(x, 0);         // 设置 x 对应的引脚为推挽输出模式
            led_set_io_pp(y, 1);         // 设置 y 对应的引脚为推挽输出模式
        }

    }
    row++;
    if (row == ROWS)
    {
        row = 0;
    }
}

void led_matrix_run2(void)
{
    static unsigned char cycle = 0, row = 0;
    static uint8_t scanType = 0;

    uint8_t rowCount = 0;
    uint8_t rowSet = 0;

    for (rowCount = (scanType == 0 ? 0 : 3); rowCount < (scanType == 0 ? 3 : 6); rowCount++)
    {
        if (row == rowCount)
            continue;
        if (cycle == led_duty_cycles_tmp[rowCount])
        {
            if(cycle!=0)
                led_set_io_od(rowCount);
        }
        else if (cycle == 0)
        {
            if (rowSet == 0)
            {
                led_set_io_pp(row, 0);
                rowSet = 1;
            }
            led_set_io_pp(rowCount, 1);
        }
        
        
    }
    
   
    cycle++;

    
    if (cycle == LED_PWM_CYCLES)
    {
        cycle = 0;
        for (rowCount = 0; rowCount < LED_MATRIX_NUM_PINS; rowCount++)
        {
            led_set_io_od(rowCount);
        }
        row++;
        if (row == LED_MATRIX_NUM_PINS)
        {
            row = 0;
            scanType = (scanType == 0) ? 1 : 0;
        }
        tyw_memcpy(led_duty_cycles_tmp, led_duty_cycles[row], sizeof(led_duty_cycles_tmp));

       
        
        for (rowCount = (scanType == 0 ? 0 : 3); rowCount < (scanType == 0 ? 3 : 6); rowCount++)
        {
            if (row == rowCount)
                continue;
            if (cycle == led_duty_cycles_tmp[rowCount])
            {
                if(cycle!=0)
                    led_set_io_od(rowCount);
            }
            else if (cycle == 0)
            {
                if (rowSet == 0)
                {
                    led_set_io_pp(row, 0);
                    rowSet = 1;
                }
                led_set_io_pp(rowCount, 1);
            }
            
            
        }
        
       
        cycle++;
        
        
        
    }

}

void led_set_io_od(uint8_t io_num) 
{
    switch(io_num)
    {
        case 0:
            LED_PIN_OD_1;
            break;
        case 1:
            LED_PIN_OD_2;
            break;
        case 2:
            LED_PIN_OD_3;
            break;
        case 3:
            LED_PIN_OD_4;
            break;
        case 4:
            LED_PIN_OD_5;
            break;
        case 5:
            LED_PIN_OD_6;
            break;
        case 6:
            LED_PIN_OD_7;
            break;
        case 7:
            LED_PIN_OD_8;
            break;
        
        default:
            break;
    }
}

//设置为推挽输出
void led_set_io_pp(uint8_t io_num,uint8_t type) 
{
    switch(io_num)
    {
        case 0:
            LED_PIN_PP_1(type);
            
            break;
        case 1:
            LED_PIN_PP_2(type);
            break;
        case 2:
            LED_PIN_PP_3(type);
            break;
        case 3:
            LED_PIN_PP_4(type);
            break;
        case 4:
            LED_PIN_PP_5(type);
            break;
        case 5:
            LED_PIN_PP_6(type);
            break;
        case 6:
            LED_PIN_PP_7(type);
            break;
        case 7:
            LED_PIN_PP_8(type);
            break;
        
        default:
            break;
    }
}

void led_show_clear(void)
{    
    tyw_memset(led_duty_cycles,0,sizeof(led_duty_cycles));
}

void led_show_set(void)
{    
    tyw_memset(led_duty_cycles,LED_PWM_CYCLES,sizeof(led_duty_cycles));
}


const uint8_t  font[]={
	
	0x3F, // '0'
    0x06, // '1'
    0x5B, // '2'
    0x4F, // '3'
    0x66, // '4'
    0x6D, // '5'
    0x7D, // '6'
    0x07, // '7'
    0x7F, // '8'
    0x6F, // '9'
};

const uint8_t  numberIndex[LED_NUMBER_SHOW_MAX][7][2]=
{
    {{1,0},{2,0},{3,0},{4,0},{5,0},{6,0},{7,0}},
    {{0,1},{2,1},{3,1},{4,1},{5,1},{6,1},{7,1}},
    {{0,2},{1,2},{3,2},{4,2},{5,2},{6,2},{7,2}},
    {{0,3},{1,3},{2,3},{4,3},{5,3},{6,3},{7,3}},
};

void led_show_num(unsigned char id,unsigned char num)
{
    unsigned char ch;
    uint8_t i=0;
	if(num>9)
		return ;
	ch= font[num];
	
	
	if(id>LED_NUMBER_SHOW_MAX)
		return ;
    
    for(i=0;i<7;i++)
    {
        if(ch &0x01==1)
        {
            led_duty_cycles[numberIndex[id][i][0]][numberIndex[id][i][1]]=LED_PWM_CYCLES;
        }
        else
        {
            led_duty_cycles[numberIndex[id][i][0]][numberIndex[id][i][1]]=0;
        }
        
        ch >>= 1;
    }
    

}

void led_show_power(uint8_t powerPercent)
{
    uint8_t tens=0;
    uint8_t ones=0;
    
    if(powerPercent>=99)
    {
        
        led_duty_cycles[0][5]=LED_PWM_CYCLES;
        led_duty_cycles[1][5]=LED_PWM_CYCLES;
        led_duty_cycles[2][5]=LED_PWM_CYCLES;
        led_duty_cycles[3][5]=LED_PWM_CYCLES;
        led_duty_cycles[4][5]=LED_PWM_CYCLES;
        led_duty_cycles[5][5]=LED_PWM_CYCLES;

        led_show_num(2,9);
        led_show_num(3,9);
    }
    else
    {
        // 提取十位
        tens = (powerPercent / 10) % 10;;

        // 提取个位
        ones = powerPercent % 10;
        
        led_show_num(2,tens);
        led_show_num(3,ones);
    }
    
    if(powerPercent<4)
    {
        led_duty_cycles[0][5]=0;
        led_duty_cycles[1][5]=0;
        led_duty_cycles[2][5]=0;
        led_duty_cycles[3][5]=0;
        led_duty_cycles[4][5]=0;
        led_duty_cycles[5][5]=0;
    }
    else if(powerPercent<20)
    {
        led_duty_cycles[0][5]=LED_PWM_CYCLES;
        led_duty_cycles[1][5]=0;
        led_duty_cycles[2][5]=0;
        led_duty_cycles[3][5]=0;
        led_duty_cycles[4][5]=0;
        led_duty_cycles[5][5]=0;
    }
    else if(powerPercent<36)
    {
        led_duty_cycles[0][5]=LED_PWM_CYCLES;
        led_duty_cycles[1][5]=LED_PWM_CYCLES;
        led_duty_cycles[2][5]=0;
        led_duty_cycles[3][5]=0;
        led_duty_cycles[4][5]=0;
        led_duty_cycles[5][5]=0;
    }
    else if(powerPercent<52)
    {
        led_duty_cycles[0][5]=LED_PWM_CYCLES;
        led_duty_cycles[1][5]=LED_PWM_CYCLES;
        led_duty_cycles[2][5]=LED_PWM_CYCLES;
        led_duty_cycles[3][5]=0;
        led_duty_cycles[4][5]=0;
        led_duty_cycles[5][5]=0;
    }
    else if(powerPercent<68)
    {
        led_duty_cycles[0][5]=LED_PWM_CYCLES;
        led_duty_cycles[1][5]=LED_PWM_CYCLES;
        led_duty_cycles[2][5]=LED_PWM_CYCLES;
        led_duty_cycles[3][5]=LED_PWM_CYCLES;
        led_duty_cycles[4][5]=0;
        led_duty_cycles[5][5]=0;
    }
    else if(powerPercent<84)
    {
        led_duty_cycles[0][5]=LED_PWM_CYCLES;
        led_duty_cycles[1][5]=LED_PWM_CYCLES;
        led_duty_cycles[2][5]=LED_PWM_CYCLES;
        led_duty_cycles[3][5]=LED_PWM_CYCLES;
        led_duty_cycles[4][5]=LED_PWM_CYCLES;
        led_duty_cycles[5][5]=0;
    }
    else
    {
        led_duty_cycles[0][5]=LED_PWM_CYCLES;
        led_duty_cycles[1][5]=LED_PWM_CYCLES;
        led_duty_cycles[2][5]=LED_PWM_CYCLES;
        led_duty_cycles[3][5]=LED_PWM_CYCLES;
        led_duty_cycles[4][5]=LED_PWM_CYCLES;
        led_duty_cycles[5][5]=LED_PWM_CYCLES;
    }
    
    
    if( F_Charger == True)
    {
        led_duty_cycles[7][5]=LED_PWM_CYCLES;
    }
    else
        led_duty_cycles[7][5]=0;

}

void led_show_oil(uint8_t  TobaccoOilPercent)
{
    uint8_t tens=0;
    uint8_t ones=0;
    
    if(TobaccoOilPercent>=99)
    {
        
        
        led_duty_cycles[0][4]=LED_PWM_CYCLES;
        led_duty_cycles[1][4]=LED_PWM_CYCLES;
        led_duty_cycles[2][4]=LED_PWM_CYCLES;
        led_duty_cycles[3][4]=LED_PWM_CYCLES;
        led_duty_cycles[5][4]=LED_PWM_CYCLES;
        led_duty_cycles[6][4]=LED_PWM_CYCLES;

        led_show_num(0,9);
        led_show_num(1,9);
    }
    else
    {
        // 提取十位
        tens = (TobaccoOilPercent / 10) % 10;;

        // 提取个位
        ones = TobaccoOilPercent % 10;
        
        led_show_num(0,tens);
        led_show_num(1,ones);
    }
    
    if(TobaccoOilPercent<4)
    {
        led_duty_cycles[0][4]=0;
        led_duty_cycles[1][4]=0;
        led_duty_cycles[2][4]=0;
        led_duty_cycles[3][4]=0;
        led_duty_cycles[5][4]=0;
        led_duty_cycles[6][4]=0;
    }
    else if(TobaccoOilPercent<20)
    {
        led_duty_cycles[0][4]=LED_PWM_CYCLES;
        led_duty_cycles[1][4]=0;
        led_duty_cycles[2][4]=0;
        led_duty_cycles[3][4]=0;
        led_duty_cycles[5][4]=0;
        led_duty_cycles[6][4]=0;
    }
    else if(TobaccoOilPercent<36)
    {
        led_duty_cycles[0][4]=LED_PWM_CYCLES;
        led_duty_cycles[1][4]=LED_PWM_CYCLES;
        led_duty_cycles[2][4]=0;
        led_duty_cycles[3][4]=0;
        led_duty_cycles[5][4]=0;
        led_duty_cycles[6][4]=0;
    }
    else if(TobaccoOilPercent<52)
    {
        led_duty_cycles[0][4]=LED_PWM_CYCLES;
        led_duty_cycles[1][4]=LED_PWM_CYCLES;
        led_duty_cycles[2][4]=LED_PWM_CYCLES;
        led_duty_cycles[3][4]=0;
        led_duty_cycles[5][4]=0;
        led_duty_cycles[6][4]=0;
    }
    else if(TobaccoOilPercent<68)
    {
        led_duty_cycles[0][4]=LED_PWM_CYCLES;
        led_duty_cycles[1][4]=LED_PWM_CYCLES;
        led_duty_cycles[2][4]=LED_PWM_CYCLES;
        led_duty_cycles[3][4]=LED_PWM_CYCLES;
        led_duty_cycles[5][4]=0;
        led_duty_cycles[6][4]=0;
    }
    else if(TobaccoOilPercent<84)
    {
        led_duty_cycles[0][4]=LED_PWM_CYCLES;
        led_duty_cycles[1][4]=LED_PWM_CYCLES;
        led_duty_cycles[2][4]=LED_PWM_CYCLES;
        led_duty_cycles[3][4]=LED_PWM_CYCLES;
        led_duty_cycles[5][4]=LED_PWM_CYCLES;
        led_duty_cycles[6][4]=0;
    }
    else
    {
        led_duty_cycles[0][4]=LED_PWM_CYCLES;
        led_duty_cycles[1][4]=LED_PWM_CYCLES;
        led_duty_cycles[2][4]=LED_PWM_CYCLES;
        led_duty_cycles[3][4]=LED_PWM_CYCLES;
        led_duty_cycles[5][4]=LED_PWM_CYCLES;
        led_duty_cycles[6][4]=LED_PWM_CYCLES;
    }
    
  
    led_duty_cycles[7][4]=LED_PWM_CYCLES;
  
}

void showSmokeMode(uint8_t mode)
{

    switch(mode)
    {
        case 0:
            led_duty_cycles[0][6]=LED_PWM_CYCLES;
            led_duty_cycles[1][6]=LED_PWM_CYCLES;
            led_duty_cycles[2][6]=LED_PWM_CYCLES;
            break;
        case 1:
            led_duty_cycles[3][6]=LED_PWM_CYCLES;
            led_duty_cycles[4][6]=LED_PWM_CYCLES;
            led_duty_cycles[5][6]=LED_PWM_CYCLES;
        break;
        case 2:
            led_duty_cycles[7][6]=LED_PWM_CYCLES;
            led_duty_cycles[0][7]=LED_PWM_CYCLES;
            led_duty_cycles[1][7]=LED_PWM_CYCLES;
        break;
        default:
        break;
    }
}       



void led_all_test(void)
{
 
    tyw_memset(led_duty_cycles,0,sizeof(led_duty_cycles));
//    
//    
    tyw_memset(led_duty_cycles,LED_PWM_CYCLES,sizeof(led_duty_cycles));
//        
        
//    while(1)
//    {
//        if(pageIDFlag)
//        {
//            pageID++;
//            if(pageID>LED_PWM_CYCLES)
//                pageIDFlag=False;
//        }
//        else
//        {
//            pageID--;
//            if(pageID==0)
//               pageIDFlag=True; 
//        }
//        
//        tyw_memset(led_duty_cycles,pageID,sizeof(led_duty_cycles));
//    }
    
    
//    led_duty_cycles[2][1]=16;

    // led_show_num(0,6);
    // led_show_num(1,5);
    // led_show_num(2,4);
    // led_show_num(3,9);  


    // led_duty_cycles[7][6]=LED_PWM_CYCLES;
    // led_duty_cycles[0][7]=LED_PWM_CYCLES;
    // led_duty_cycles[1][7]=LED_PWM_CYCLES;


    //    led_show_power(64); 

    //    led_show_oil(88);

    //    showSmokeMode(2);
    return ;    
}



void tyw_delay_ms(uint32_t ms)
{
	unsigned int i;
	unsigned char delay_cnt;
	for(i = 0;i<ms;i++)
	{
		delay_cnt = 200;
		while(delay_cnt--)
		{
			Delay_16nop();
		}
	}
}

void led_one_test(uint8_t row,uint8_t cow)     //测试函数，用来测试某一段数码管，用的时候放在w主函数中的while（1）
{
    row=7;     // 将传入的行数设为7
    cow=6;     // 将传入的列数设为6
   uint8_t rowCount=0;
   for (rowCount = 0; rowCount < LED_MATRIX_NUM_PINS; rowCount++)
   {
       led_set_io_od(rowCount);     // 循环设置 LED 矩阵的引脚为开漏输出模式
   }

   led_set_io_pp(row, 0);         
   led_set_io_pp(cow, 1);
        
while(1)
{
    asm("CLRWDT");
    // led_set_io_pp(7, 0);
    // tyw_delay_ms(1000);
    // led_set_io_pp(7, 1);
    //  tyw_delay_ms(1000);
}
;   //?
  
    

}

void gpio_test(void)
{
       
    uint16_t thousand;
    uint16_t hundred ;
    uint16_t ten ;
    uint16_t one ;
    
   InitGpio();
    
    while(1)
    {
        PWMPD_CH2_ON;
       // P0_3=0;
        bsp_delay_ms(1);
        PWMPD_CH2_OFF;
       // P0_3=1;
        bsp_delay_ms(10);
    }
    
    while(1)
    {
        
        
        
        
//        P0_3=0;
//        bsp_delay_ms(3);
        
        
//        bsp_delay_ms(1);
//        P0_3=1;
        
        
         thousand = (GetADC.LoadRes / 1000) % 10;
         hundred = (GetADC.LoadRes / 100) % 10;
         ten = (GetADC.LoadRes / 10) % 10;
         one = GetADC.LoadRes % 10;
        
        
        
        
        led_duty_cycles[1][3]=LED_PWM_CYCLES;
        led_duty_cycles[3][0]=LED_PWM_CYCLES;
        
        led_show_num(0,thousand);
        led_show_num(1,hundred);
        
        bsp_delay_ms(20);
        
        led_duty_cycles[1][3]=0;
        led_duty_cycles[3][0]=0;
        
        led_show_num(0,ten);
        led_show_num(1,one);
        
        bsp_delay_ms(20);
        
        
//        if(SW1_UP)
//        {
//            led_show_num(0,1);
//        }
//        else if(SW2_UP)
//        {
//            led_show_num(0,2);
//        }
//        else
//            led_show_num(0,3);
        
        
//        if(SW2_DOWN)
//        {
//            led_show_num(0,1);
//            PWMPD_ON2;
//        }
//        else
//        {
//            PWMPD_OFF2;
//            led_show_num(0,0);
//        }
//        
//        if(SW1_DOWN)
//        {
//            PWMPD_ON;
//            led_show_num(2,1);
//        }
//        else
//        {
//            PWMPD_OFF;
//            led_show_num(2,0);
//        }
        
        
//        if(CHARGER_IN)
//        {
//            led_show_num(1,1);
//        }
//        else
//        {
//            led_show_num(1,0);
//        }
//        
//        
//        if(PDKEY_DOWN)
//        {
//            led_show_num(0,1);
//        }
//        else
//        {
//            led_show_num(0,0);
//        }
        
        
    }
    
}

