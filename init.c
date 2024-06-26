/******************************************************************************
 **	Function :	init.c 文件
 ******************************************************************************/


/******************************************************************************
 ** Include files
 ******************************************************************************/
// #include 	<pic.h>
#include 	<htc.h>
#include  	"Func.h"
#include  	"init.h"


/*******************************************************************************
 * \brief   void  Delay_16nop(void)
 *          空指令延时几个指令周期.
 * \param   [in]  void
 * \retval  void
 * \note	因CLKPSC有延迟,改变CLKPSC之后,需等待16个时钟周期之后,再把慢时钟切换至快时钟	
 ******************************************************************************/
void  Delay_16nop(void)
{
	asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");	
	asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");	
}


/*******************************************************************************
 * \brief   void  SystemClockInit(void)
 *          系统时钟初始化函数.
 * \param   [in]  void
 * \retval  void
 * \note	此处分频的系统时钟为 Project Option 里选项(16MHZ/8MHZ),
 * 			工程配置选择8MHZ
 ******************************************************************************/
void  SystemClockInit(void)
{
	//系统时钟(FSYS)设置		//复位后,该设备在慢钟模式85KHz的SIRC运行。
	//CPUPSC:系统时钟分频器，生效延迟最大为16个时钟周期(bit1/bit0)
	//00:系统时钟是快/慢时钟除以8;01:系统时钟是快/慢时钟除以4;
	//10:系统时钟是快/慢时钟除以2; 11:系统时钟是快/慢时钟除以1;	

	SYSCLOCK_DIV_1;	//Clock div 1    8M/(8,4,2,1)
	Delay_16nop();

	STPFCK_OFF;	  	//设为1,停止快时钟以节省慢钟/空闲模式的电力。该位只能在慢钟模式时改变。
	Delay_16nop();

	SELFCK_FAST;	//系统时钟源选择。此位只有当STPFCK=0才可以改变。0:慢时钟;1:快时钟;
	Delay_16nop();	
}


/*******************************************************************************
 * \brief   void  Init_BOD_WDT(void)
 *          看门狗、LVD初始化函数.
 * \param   [in]  void
 * \retval  void
 * \note	
 ******************************************************************************/
void  Init_BOD_WDT(void)
{
	//使能欠压中断 /复位
	LVDIE	 = 0;		//LVD interrupt disable
	LVDIF	 = 0;		//clear LVD interrupt flag
	LVDSEL_2450mV;		//LVD 设置2.45V
	LVDHYS_ENABLE;		//使能LVD迟滞响应20mV->40mV
	PDOWN_LVR_DISABLE;
	PDOWN_LVD_DISABLE;	//设置休眠低功耗

	//初始化WDT，WKT	//WDT低功耗设置在工程选项里
	OPTION	&= 0xF3;	//OPTION[3:2]:	WDTPSC	
	OPTION	|= 0x0C;	//00:96ms 01:192ms 10:768ms 11:1536ms
	asm("CLRWDT");

	WKTIE	 = 0;		//WKT interrupt disable
	WKTIF	 = 0;		//clear WKT interrupt flag	
	OPTION	&= 0xFC;	//OPTION[1:0]:	WKTPSC
	OPTION	|= 0x03;	//00:12ms 01:24ms 10:48ms 11:96ms
}


/*******************************************************************************
 * \brief   void  InitGpio(void)
 *          GPIO 初始化函数.
 * \param   [in]  void
 * \retval  void
 * \note	如果ADC参考电压选择非VCC参考电压，休眠需切换回VCC以降低功耗。
 ******************************************************************************/
void  InitGpio(void)
{
	//设置PA口
	PAD			= 0xE8;		//11101000
	PAMOD76		= PAMOD76 & 0x00 | PIN_H_Mode_OD_IPU_WAKEUP | PIN_L_Mode_OD_WAKEUP;  //KEY CHRG/vin
	PAMOD54		= PAMOD54 & 0x00 | PIN_H_Mode_ADC | PIN_L_Mode_PP;  // AD2 PWM1
	PAMOD32		= PAMOD32 & 0x00 | PIN_H_Mode_ADC | PIN_L_Mode_PP; //AD1 PWM2
	PAMOD10		= PAMOD10 & 0x00 | PIN_H_Mode_OD | PIN_L_Mode_OD;  //SDA SCL
	
	//设置PB口
	PBD			= 0x04;		//00000100
	PBMOD76		= PBMOD76 & 0x00 | PIN_H_Mode_PP | PIN_L_Mode_PP; //D7 D6
	PBMOD54		= PBMOD54 & 0x00 | PIN_H_Mode_PP | PIN_L_Mode_PP; //D5 D4
	PBMOD32		= PBMOD32 & 0x00 | PIN_H_Mode_PP | PIN_H_Mode_OD_WAKEUP; //D1 MIC
	PBMOD10		= PBMOD10 & 0x00 | PIN_H_Mode_PP | PIN_L_Mode_PP; //LEDX1 D8

	PDD			= 0x00;		//
	PDMOD10		= PDMOD10 & 0x00 | PIN_H_Mode_PP | PIN_L_Mode_PP;  // D3 D2
	
	PIN_HSINK_DISABLE;	//GPIO低驱动电流输出

//	INT0EDG		= 0;    //Falling edge active for INT0 pin
						//0: falling edge, 1: rising edge
//	INT0IE 		= 1;	//INT0 interrupt enable

//	INT1EDG		= 0;    //Falling edge active for INT1 pin
						//0: falling edge, 1: rising edge
//	INT1IE 		= 1;	//INT1 interrupt enable

//	INT2IE      = 1;  	//INT2 interrupt enable 下降沿触发	

	//ADC设置
	ADCTL 	   &= ADCKS_Mask;
	ADCTL      |= ADCKS_sys_8;		//ADC CLK = FSYSCLK /8
	ADC_IVREF_VDD;	//ADCVREFS = VCC;   VBG = 1.20V 	
}


/*******************************************************************************
 * \brief   void  MCU_INIT_TIME(void)
 *          Timerx 定时器初始化函数.
 * \param   [in]  void
 * \retval  void
 * \note	
 ******************************************************************************/
void  MCU_INIT_TIMER(void)
{
	//--------------------------- TIMER0(8bit；0xFF向下计数) 设置---------------
	TIMER0_DISABLE;	//关闭TIMER0
	TM0IE	 = 0;	
	TM0IF	 = 0;	//清TIMER0中断标志、禁止中断
	SELT0CLK_FSYSCLK_2;	//TIMER0时钟源选择系统时钟二分频
	T0CKS_DIV_4;	//TIMER0时钟四分频
	TM0		 = 256 - kTIMER0RLD;	
	TM0RLD	 = 256 - kTIMER0RLD;	//TIMER0初值、重载值	//timer0 interrupt time set
	
	//--------------------------- TIMER1(8bit；0xFF向下计数) 设置---------------
	TIMER1_DISABLE;	//关闭TIMER1
	TM1IE	 = 0;	
	TM1IF	 = 0;	//清TIMER1中断标志、禁止中断
	T1CKS_DIV_32;	//TIMER1时钟32分频
	TM1		 = 256 - kTIMER1RLD;
	TM1RLD	 = 256 - kTIMER1RLD;	//TIMER1初值、重载值	//timer1 interrupt time set

	//--------------------------- TIMER2(15bit溢出计数) 设置--------------------
	TIMER2_DISABLE;	//关闭TIMER2
	T2IE	 = 0;	
	T2IF	 = 0;	//清TIMER2中断标志、禁止中断
	T2CKS_DIV_32768;	//TIMER2时钟32768分频	最长中断时间	//timer2 interrupt time set	


	TM0IE 	 = 1;	//timer0 interrupt enable
	TIMER0_ENABLE;	//开启TIMER0	//timer0 running

//	TM1IE	 = 1;	//timer1 interrupt enable
//	TIMER1_ENABLE;	//开启TIMER1	//timer1 running

//	TM2IE	 = 1;	//timer2 interrupt enable
//	TIMER2_ENABLE;	//开启TIMER2	//timer2 running
}


/*******************************************************************************
 * \brief   void  MCU_INIT_PWM(unsigned int pwm_prd,unsigned int pwm_duty)
 *          PWMx 初始化函数.
 * \param   [in]  unsigned int pwm_prd	PWM周期
 * \param   [in]  unsigned int pwm_duty	PWM占空比
 * \param   [in]  unsigned char pwm0_dz	PWM0互补输出死区时间(0~15PWMCLK)
 * \retval  void
 * \note	
 ******************************************************************************/
#if PWMx_EN
void  InitPWM(unsigned int pwm_prd,unsigned int pwm_duty,unsigned char pwm0_dz)
{
	PWMx_DISABLE;	//stop PWMx
	PWMIE	    = 0;	//PWMx   Interrupt disable
	PWMIF	    = 0; 	//clear PWMx Interrupt Flag	

	SELPWMxCLK_FIRC;	//OPTION2[5:4]:	00/01:FSYSCLK  10:FRC  11:FRC*2
	PWMPRDL 	= pwm_prd&0xFF;		//写 先低后高   读 先高后低
	PWMPRDH 	= (pwm_prd>>8)&0xFF;
	PWM0_MODE2_ENABLE;	//PWM0模式2
	PWMCTL	   &= 0xF0;
	PWMCTL 	   |= pwm0_dz;	//设置互补PWM死区时间

	PWM0DL 		= pwm_duty&0xFF;
	PWM0DH 	   	= (pwm_duty>>8)&0xFF;	//PWM0互补输出占空比，PWM0P 高电平有效
	PWM1DL 		= pwm_duty&0xFF;
	PWM1DH 	   	= (pwm_duty>>8)&0xFF;
	PWM2DL 		= pwm_duty&0xFF;
	PWM2DH 	   	= (pwm_duty>>8)&0xFF;
	PWM3DL 		= pwm_duty&0xFF;
	PWM3DH 	   	= (pwm_duty>>8)&0xFF;
	PWM4DL 		= pwm_duty&0xFF;
	PWM4DH 	   	= (pwm_duty>>8)&0xFF;
	PWM5DL 		= pwm_duty&0xFF;
	PWM5DH 	   	= (pwm_duty>>8)&0xFF;	//PWM1~PWM5共周期不同占空比

	PWMx_ENABLE;	//start PWMx

	while(pwm_prd)	
	{
		asm("CLRWDT");
		pwm_prd--;
		Delay_16nop();
	}	//延时等待PWM更新新的输出周期稳定输出，再开启相应IO输出PWM

//	PAMOD76		= PAMOD76 & 0xF0 | PIN_L_Mode_AF;	//PA6---PWM0N
//	PAMOD54		= PAMOD54 & 0x0F | PIN_H_Mode_AF;	//PA5---PWM3
//	PAMOD54		= PAMOD54 & 0xF0 | PIN_L_Mode_AF;	//PA4---PWM0P	
//	PAMOD32		= PAMOD32 & 0x0F | PIN_H_Mode_AF;	//PA3---PWM2
//	PAMOD32		= PAMOD32 & 0xF0 | PIN_L_Mode_AF;	//PA2---PWM4
//	PAMOD10		= PAMOD10 & 0x0F | PIN_H_Mode_AF;	//PA1---PWM1
//	PAMOD10		= PAMOD10 & 0xF0 | PIN_L_Mode_AF;	//PA0---PWM5	

//	PBMOD76		= PBMOD76 & 0xF0 | PIN_L_Mode_AF;	//PB6---PWM0N
//	PBMOD54		= PBMOD54 & 0x0F | PIN_H_Mode_AF;	//PB5---PWM5
//	PBMOD54		= PBMOD54 & 0xF0 | PIN_L_Mode_AF;	//PB4---PWM0P
//	PBMOD32		= PBMOD32 & 0x0F | PIN_H_Mode_AF;	//PB3---PWM4	
//	PBMOD32		= PBMOD32 & 0xF0 | PIN_L_Mode_AF;	//PB2---PWM3
//	PBMOD10		= PBMOD10 & 0x0F | PIN_H_Mode_AF;	//PB1---PWM2
//	PBMOD10		= PBMOD10 & 0xF0 | PIN_L_Mode_AF;	//PB0---PWM1	
}
#endif


/*******************************************************************************
 * \brief   void  ClearAllRAM(void)
 *          清 RAM区 函数.
 * \param   [in]  void
 * \retval  void
 * \note	
 ******************************************************************************/
void  ClearAllRAM(void)
{
	IRP = 0;	//切换到 BANK0/BANK1	
 	for(FSR = 0x20; FSR < 0x80; FSR++)
 	{
  		INDF = 0;	//清 BANK0 区域
 	}
	
 	for(FSR = 0xA0; FSR < 0xF0; FSR++)
 	{
  		INDF = 0;	//清 BANK1 区域	
 	}
	
	IRP = 1;	//切换到 BANK2	
	for(FSR = 0x20; FSR < 0x60; FSR++)
	{
		INDF = 0;	//清 BANK2 区域
	}

	//清零所有RAM完成，切换回 BANK0
	IRP = 0;RP0 = 0;RP1 = 0;	
}