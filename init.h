/******************************************************************************
 ** Define to prevent recursive inclusion
 ******************************************************************************/
#ifndef  _INIT_H
#define  _INIT_H

/**************************** USER CODE BEGIN Private defines ****************/
//--------------------------- FSYSCLK 相关寄存器设置 ---------------------------

#define	 SYSCLOCK_DIV_8		        CLKCTL = (CLKCTL&0xFC)
#define	 SYSCLOCK_DIV_4		        CLKCTL = (CLKCTL&0xFC)|0x01
#define	 SYSCLOCK_DIV_2		        CLKCTL = (CLKCTL&0xFC)|0x02
#define	 SYSCLOCK_DIV_1		        CLKCTL = (CLKCTL&0xFC)|0x03

#define  SCKTYPE_SIRC    	        CLKCTL = (CLKCTL&0x7F)
#define  SCKTYPE_SXT    	        CLKCTL = (CLKCTL|0x80)
#define	 FCKTYPE_FIRC		        CLKCTL = (CLKCTL&0xAF)
#define	 FCKTYPE_FXT		        CLKCTL = (CLKCTL&0xAF)|0x40
#define	 STPSCK_OPEN		        CLKCTL = (CLKCTL|0x10)
#define	 STPSCK_OFF		            CLKCTL = (CLKCTL&0xEF)
#define	 STPFCK_OPEN		        CLKCTL = (CLKCTL|0x08)
#define	 STPFCK_OFF		            CLKCTL = (CLKCTL&0xF7)
#define	 SELFCK_SLOW		        CLKCTL = (CLKCTL&0xFB)
#define	 SELFCK_FAST		        CLKCTL = (CLKCTL|0x04)

//--------------------------- GPIO 相关寄存器设置 -----------------------------
#define  PORT0                      0
#define  PORT1                      1
#define  PORT2                      2
#define  PORT3                      3

#define	 PIN_L_Mode_OD_IPU	  		0x00    //开漏带上拉
#define	 PIN_L_Mode_OD 	  			0x01    //开漏  0x05
#define	 PIN_L_Mode_ADC		  		0x03    //ADC
#define	 PIN_L_Mode_OD_IPD	  		0x04    //开漏带下拉
#define	 PIN_L_Mode_PP		  		0x06    //推挽输出  0x02  0x0A  0x0E
#define	 PIN_L_Mode_AF 		  		0x07    //PWM TxO CKO LED
#define	 PIN_L_Mode_OD_IPU_WAKEUP	0x08    //开漏带上拉+唤醒
#define	 PIN_L_Mode_OD_WAKEUP 	  	0x09    //开漏+唤醒 0x0D
#define	 PIN_L_Mode_OD_IPD_WAKEUP	0x0C    //开漏带下拉+唤醒
#define	 PIN_L_Mode_COM		  		0x0F    //LCD 1/2BIAS

#define	 PIN_H_Mode_OD_IPU	  		0x00    //开漏带上拉
#define	 PIN_H_Mode_OD 		  		0x10    //开漏  0x50
#define	 PIN_H_Mode_ADC		  		0x30    //ADC
#define	 PIN_H_Mode_OD_IPD	  		0x40    //开漏带下拉
#define	 PIN_H_Mode_PP		  		0x60    //推挽输出  0x20  0xA0  0xE0
#define	 PIN_H_Mode_AF 		  		0x70    //PWM TxO CKO LED
#define	 PIN_H_Mode_OD_IPU_WAKEUP	0x80    //开漏带上拉+唤醒
#define	 PIN_H_Mode_OD_WAKEUP 		0x90    //开漏+唤醒  0xD0
#define	 PIN_H_Mode_OD_IPD_WAKEUP	0xC0    //开漏带下拉+唤醒
#define	 PIN_H_Mode_COM		  		0xF0    //LCD 1/2BIAS

#define  PIN_HSINK_ENABLE           PINMOD &= 0xD8;PINMOD |= 0x04
#define  PIN_HSINK_DISABLE          PINMOD &= 0xD8


//--------------------------- MCU BY UART ͨ�� --------------------------------
#define	 GPIO_UART_TX				PBD7
#define	 GPIO_UART_RX				PBD3


//--------------------------- ģ������ IIC ͨ�� -------------------------------
#define	 GPIO_I2C_SDA				PBD3
#define	 SET_I2C_SDA				GPIO_I2C_SDA = 1
#define	 CLR_I2C_SDA				GPIO_I2C_SDA = 0	

#define	 GPIO_I2C_SCL				PBD7
#define	 SET_I2C_SCL				GPIO_I2C_SCL = 1
#define	 CLR_I2C_SCL				GPIO_I2C_SCL = 0


//------------------------- RGB�ƹ���� ------LED_EN -------------------------

#define  GPIO_SEG_LED8              PBD0
#define  GPIO_SEG_LED7              PBD7
#define  GPIO_SEG_LED6              PBD6
#define  GPIO_SEG_LED5              PBD5
#define  GPIO_SEG_LED4              PBD4
#define  GPIO_SEG_LED3              PDD1
#define  GPIO_SEG_LED2              PDD0
#define  GPIO_SEG_LED1              PBD3



//------------------------- ���ģ�����/��� ------CHARGER--------------------
#define  GPIO_CHRG_STATE            PAD6
#define  CHRG_STATE_DOWN            GPIO_CHRG_STATE == 0
#define  CHRG_STATE_UP              GPIO_CHRG_STATE == 1

#define  GPIO_CHRG                  PAD6
#define  CHARGER_IN                 GPIO_CHRG == 1
#define  CHARGER_OUT                GPIO_CHRG == 0




//------------------------- ��ͷ/������� ------MIC/KEY-----------------------
#define  GPIO_MIC                   PBD2
#define  PDMIC_UP                   GPIO_MIC == 0
#define  PDMIC_DOWN                 GPIO_MIC == 1

#define  GPIO_KEY                   PAD7
#define  PDKEY_UP                   GPIO_KEY == 1
#define  PDKEY_DOWN                 GPIO_KEY == 0


//------------------------- �������/��� ------PWM_OUT-----------------------


#define  OUT_MOS_ON                 0
#define  OUT_MOS_OFF                1

#define  GPIO_OUT_EN                PAD4
#define  PWMPD_ON                   GPIO_OUT_EN = OUT_MOS_ON 
#define  PWMPD_OFF                  GPIO_OUT_EN = OUT_MOS_OFF


#define  GPIO_OUT_CH2_EN            PAD2
#define  PWMPD_CH2_ON               GPIO_OUT_CH2_EN = OUT_MOS_ON 
#define  PWMPD_CH2_OFF              GPIO_OUT_CH2_EN = OUT_MOS_OFF



#define  GPIO_TEST_LOAD             PAD3
#define  TEST_LOAD_OFF              GPIO_TEST_LOAD = 1 
#define  TEST_LOAD_ON               GPIO_TEST_LOAD = 0


#define  GPIO_LOAD                  PAD3
#define  LOAD_UP                    GPIO_LOAD == 1
#define  LOAD_DOWN                  GPIO_LOAD == 0

#define  GPIO_LOAD2                 PAD5
#define  LOAD2_UP                   GPIO_LOAD2 == 1
#define  LOAD2_DOWN                 GPIO_LOAD2 == 0


//--------------------------- ADCѡ��ͨ����CH��-------------------------------
#define	 ADC_CH_TC            		8
#define	 ADC_CH_IBAT           		14      //23---1/4VCC    //14---VBG1.2V		
#define	 ADC_CH_EBAT           		23
#define	 ADC_CH_CHRG            	8
#define	 ADC_CH_VOUT            	3
#define	 ADC_CH_VOUT2            	5
#define	 ADC_CH_I            	    3

//--------------------------- ADC选择参考电压----------------------------------
#define	 ADC_IVREF_VDD			    ADCTL2 &= 0x3F
#define	 ADC_IVREF_2480mV			ADCTL2 &= 0x3F;ADCTL2 |= 0x40
// #define	 ADC_IVREF_2000mV			ADCTL2 |= 0xC0

//--------------------------- 检阻参考电阻 -----------------------------------
#define  Rref_I                		200    	//0.2R*1000
#define  Rref_VOUT                	4700    //4.7R*1000

//----------------------- ADCKS:ADCTL[2:0],ADC Clock Rate -------------------
#define	 ADCKS_Mask			        0xF8	//ADC Clock Rate Mask
#define	 ADCKS_sys_256	  	        0x00	//ADC Clock Rate = FSYSCLK/256
#define	 ADCKS_sys_128		        0x01	//ADC Clock Rate = FSYSCLK/128
#define	 ADCKS_sys_64	  	        0x02	//ADC Clock Rate = FSYSCLK/64
#define	 ADCKS_sys_32		        0x03	//ADC Clock Rate = FSYSCLK/32
#define	 ADCKS_sys_16	  	        0x04	//ADC Clock Rate = FSYSCLK/16
#define	 ADCKS_sys_8		        0x05	//ADC Clock Rate = FSYSCLK/8
#define	 ADCKS_sys_4	  	        0x06	//ADC Clock Rate = FSYSCLK/4
#define	 ADCKS_sys_2		        0x07	//ADC Clock Rate = FSYSCLK/2


//-------------------- UART串口模块控制 ------UARTx_EN ------------------------
#define	 UARTx_EN					False
#define	 I2Cx_EN					False


//----------------------- PWM 模块控制 ------PWMx_EN -------------------------
#define	 PWMx_EN					False   //True
#define	 GPIOx_LED_EN				False	//此处设置True 则设置PWMx_EN=False

#define  SELPWMxCLK_FSYSCLK			OPTION2 &= 0xCF //OPTION2 &= 0xCF;OPTION2 |= 0x10   //PWMCLK = FSYSCLK
#define  SELPWMxCLK_FIRC            OPTION2 &= 0xCF;OPTION2 |= 0x20   //PWMCLK = FIRC
#define  SELPWMxCLK_2XFIRC          OPTION2 |= 0x30   //PWMCLK = FIRC*2

#define  PWM0_MODE0_ENABLE          PWMCTL &= 0xCF
#define  PWM0_MODE1_ENABLE          PWMCTL &= 0xCF;PWMCTL |= 0x10
#define  PWM0_MODE2_ENABLE          PWMCTL &= 0xCF;PWMCTL |= 0x20
#define  PWM0_MODE3_ENABLE          PWMCTL |= 0x30

#define  PWMx_ENABLE		        PWMCTL |= 0x80  //使能PWM 	
#define  PWMx_DISABLE		        PWMCTL &= 0x7F  //禁止PWM


//----------------------- Timerx 定时器重装载值 ------------------------------
#define	 kTIMER0RLD		            100			// timer0 overflow 100us	
#define	 kTIMER1RLD		            125		    // timer1 overflow 1000us
#define	 kTIMER2RLD		            983			// timer2 overflow 125us

//----------------------- Timerx 定时器时钟选择 ------------------------------
#define  SELT0CLK_FSYSCLK_2			TM0CTL &= 0xEF	//FSYSCLK/2
#define  SELT0CLK_TM0CKI_PA2		TM0CTL |= 0x10	//外部EXCKI引脚时钟
#define  TIMER0_ENABLE		        TM0CTL &= 0xBF  //使能TIMER0 	
#define  TIMER0_DISABLE		        TM0CTL |= 0x40  //禁止TIMER0

#define  SELT1CLK_FSYSCLK_2			TM1CTL &= 0xEF	//FSYSCLK/2 //TIMER1时钟源固定
#define  TIMER1_ENABLE		        TM1CTL &= 0xBF  //使能TIMER1 	
#define  TIMER1_DISABLE		        TM1CTL |= 0x40  //禁止TIMER1

#define  SELT2CLK_SCK			    T2CTL &= 0xF3	//系统慢时钟
#define  SELT2CLK_FSYSCLK_128		T2CTL &= 0xF3;T2CTL |= 0x04	//FSYSCLK/128
#define  SELT2CLK_FIRC_512		    T2CTL &= 0xF3;T2CTL |= 0x08	//FIRC/512
#define  TIMER2_ENABLE		        T2CTL &= 0xEF  //使能TIMER2 	
#define  TIMER2_DISABLE		        T2CTL |= 0x10  //禁止TIMER2

//--------------------------- Timerx 时钟分频选择 ----------------------------
#define  T0CKS_DIV_1				TM0CTL &= 0xF0
#define  T0CKS_DIV_2				TM0CTL &= 0xF0;TM0CTL |= 0x01
#define  T0CKS_DIV_4				TM0CTL &= 0xF0;TM0CTL |= 0x02
#define  T0CKS_DIV_8				TM0CTL &= 0xF0;TM0CTL |= 0x03
#define  T0CKS_DIV_16				TM0CTL &= 0xF0;TM0CTL |= 0x04
#define  T0CKS_DIV_32				TM0CTL &= 0xF0;TM0CTL |= 0x05
#define  T0CKS_DIV_64				TM0CTL &= 0xF0;TM0CTL |= 0x06
#define  T0CKS_DIV_128				TM0CTL &= 0xF0;TM0CTL |= 0x07
#define  T0CKS_DIV_256				TM0CTL |= 0x0F

#define  T1CKS_DIV_1				TM1CTL &= 0xF0
#define  T1CKS_DIV_2				TM1CTL &= 0xF0;TM1CTL |= 0x01
#define  T1CKS_DIV_4				TM1CTL &= 0xF0;TM1CTL |= 0x02
#define  T1CKS_DIV_8				TM1CTL &= 0xF0;TM1CTL |= 0x03
#define  T1CKS_DIV_16				TM1CTL &= 0xF0;TM1CTL |= 0x04
#define  T1CKS_DIV_32				TM1CTL &= 0xF0;TM1CTL |= 0x05
#define  T1CKS_DIV_64				TM1CTL &= 0xF0;TM1CTL |= 0x06
#define  T1CKS_DIV_128				TM1CTL &= 0xF0;TM1CTL |= 0x07
#define  T1CKS_DIV_256				TM1CTL |= 0x0F

#define  T2CKS_DIV_32768			T2CTL &= 0xFC
#define  T2CKS_DIV_16384			T2CTL &= 0xFC;T2CTL |= 0x01
#define  T2CKS_DIV_8192				T2CTL &= 0xFC;T2CTL |= 0x02
#define  T2CKS_DIV_128				T2CTL |= 0x03


//----------------------- LVD 设置相关寄存器 ---------------------------------
#define  LVDSEL_DISABLE             LVCTL &= 0xF0
#define  LVDSEL_2200mV              LVCTL &= 0xF0;LVCTL |= 0x01
#define  LVDSEL_2300mV              LVCTL &= 0xF0;LVCTL |= 0x02
#define  LVDSEL_2450mV              LVCTL &= 0xF0;LVCTL |= 0x03
#define  LVDSEL_2600mV              LVCTL &= 0xF0;LVCTL |= 0x04
#define  LVDSEL_2750mV              LVCTL &= 0xF0;LVCTL |= 0x05
#define  LVDSEL_2900mV              LVCTL &= 0xF0;LVCTL |= 0x06
#define  LVDSEL_3000mV              LVCTL &= 0xF0;LVCTL |= 0x07
#define  LVDSEL_3150mV              LVCTL &= 0xF0;LVCTL |= 0x08
#define  LVDSEL_3300mV              LVCTL &= 0xF0;LVCTL |= 0x09
#define  LVDSEL_3450mV              LVCTL &= 0xF0;LVCTL |= 0x0A
#define  LVDSEL_3600mV              LVCTL &= 0xF0;LVCTL |= 0x0B
#define  LVDSEL_3700mV              LVCTL &= 0xF0;LVCTL |= 0x0C
#define  LVDSEL_3850mV              LVCTL &= 0xF0;LVCTL |= 0x0D
#define  LVDSEL_4000mV              LVCTL &= 0xF0;LVCTL |= 0x0E
#define  LVDSEL_4150mV              LVCTL |= 0x0F

#define  PDOWN_LVD_DISABLE          LVCTL |= 0x10
#define  PDOWN_LVR_DISABLE          LVCTL |= 0x20
#define  LVDHYS_DISABLE             LVCTL &= 0xBF
#define  LVDHYS_ENABLE              LVCTL |= 0x40


/**************************** USER CODE END Private defines ******************/


/******************************************************************************
 *******
 *******  					函数声明
 *******
 ******************************************************************************/

void  Delay_16nop(void);
void  SystemClockInit(void);
void  Init_BOD_WDT(void);
void  InitGpio(void);
void  MCU_INIT_TIMER(void);
void  InitPWM(unsigned int pwm_prd,unsigned int pwm_duty,unsigned char pwm0_dz);
void  ClearAllRAM(void);




#endif







