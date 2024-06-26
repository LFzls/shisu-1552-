/******************************************************************************
 ** Define to prevent recursive inclusion
 ******************************************************************************/
#ifndef  _Func_H_
#define  _Func_H_


/**************************** USER CODE BEGIN Private typedef ****************/
//-------------------------- 数据类型重定义 -----------------------------------               								 
typedef  unsigned char    	uint8_t;	//无符号字符型（8 bit）
typedef  unsigned int     	uint16_t;   //无符号整型（16 bit）
typedef  unsigned long    	uint32_t;	//无符号长整型（32 bit）

typedef  unsigned char    	u8;     	//无符号字符型（8 bit）
typedef  unsigned int     	u16;    	//无符号整型（16 bit）
typedef  unsigned long    	u32;    	//无符号长整型（32 bit）

//-------------------------- 位变量数据类型重定义 ------------------------------
typedef  union
{
	unsigned char  FlagByte;
	struct
	{
		unsigned char  b0	:1;
		unsigned char  b1	:1;
		unsigned char  b2	:1;
		unsigned char  b3	:1;
		unsigned char  b4	:1;
		unsigned char  b5	:1;
		unsigned char  b6	:1;
		unsigned char  b7	:1;
	}bits;	
}FlagBits_TypeDef;

//-------------------------- 计时变量数据类型重定义 ----------------------------
typedef  struct
{
	unsigned char	TimeBase;			//定时器时基
	unsigned int	RechgFullTime;		//检测到充满电4.05V计时
    unsigned int   	SleepTime;  		//休眠时间计时
    unsigned int   	SmokeTask;  		//单次吸烟时间计时
	unsigned long	SmokeTime;			//吸烟总时长计时	
}Time_TypeDef;

//-------------------------- ADC相关变量数据类型重定义 -------------------------
typedef struct 
{
	unsigned char   LowVolCnt;        	//低压计数
	unsigned char	BatteryLevel;		//电池电量
//	unsigned char	BatteryLevelOld;	//电池电量未更新值
//	unsigned char	BatteryLxCnt;    	//电池电量改变计数	
	unsigned char	VoutOpenCnt;		//开路计数
	unsigned char	Vout_Lx;			//输出档位
    unsigned int	BatteryVoltage;   	//电池电压采样值、电池电压
    unsigned int    VoutVDD;  		  	//输出时VDD电压
    unsigned int    VoutOld;   	  	    //输出电压初始值 
	unsigned int    LoadRes;   	  	  	//负载阻值采样值、负载阻值
//	unsigned int    LoadResOld;			//实际负载阻值	
//	unsigned int	USB_Voltage;
	
	unsigned char	BatteryPercent;
	unsigned int	PercentAddCount;
	unsigned int	PercentSubCount;

    unsigned int	BatteryVoltageOld;  //
}ADC_TypeDef;

/**************************** USER CODE END Private typedef ******************/


/******************************************************************************
 **	Global variables with extern
 ******************************************************************************/
extern  FlagBits_TypeDef		SysInfoFlag;
extern  FlagBits_TypeDef		VoutInfoFlag;
extern  FlagBits_TypeDef		LedsInfoFlag;
extern	Time_TypeDef			TimeCnt;
extern	ADC_TypeDef				GetADC;
extern	volatile  uint16_t		FlagSmoke;		//吸烟中标志寄存器

extern  FlagBits_TypeDef		Com1SegLED;
extern  FlagBits_TypeDef		Com2SegLED;
extern  FlagBits_TypeDef		Com3SegLED;
extern  FlagBits_TypeDef		Com4SegLED;


/**************************** USER CODE BEGIN Private defines ****************/
//------------------------- 宏定义真/假(1/0) ----------------------------------
#define	 True					1
#define	 False          		0

#define	 Set					1
#define	 Clr          			0


//-------------------------- 系统运行状态标志位 SysInfoFlag --------------------
//系统运行模式转化标志位
#define  SetExeMode				SysInfoFlag.bits.b0 = Set
#define  ClrExeMode				SysInfoFlag.bits.b0 = Clr
#define  F_ExeMode				SysInfoFlag.bits.b0

//ADC占用状态标志位
// #define  SetStartADC			SysInfoFlag.bits.b1 = Set
// #define  ClrStartADC			SysInfoFlag.bits.b1 = Clr
// #define  F_StartADC				SysInfoFlag.bits.b1

#define  SetFirePercent			SysInfoFlag.bits.b1 = Set
#define  ClrFirePercent			SysInfoFlag.bits.b1 = Clr
#define  F_FirePercent			SysInfoFlag.bits.b1

//插入适配器标识位
#define  SetCharger       		SysInfoFlag.bits.b2 = Set
#define  ClrCharger       		SysInfoFlag.bits.b2 = Clr
#define  F_Charger    	  		SysInfoFlag.bits.b2

//充满电标志位
#define  SetBatFull       		SysInfoFlag.bits.b3 = Set
#define  ClrBatFull       		SysInfoFlag.bits.b3 = Clr
#define  F_BatFull        		SysInfoFlag.bits.b3

//上电闪灯状态标志位
#define  SetResetFlag		  	SysInfoFlag.bits.b4 = Set
#define  ClrResetFlag     		SysInfoFlag.bits.b4 = Clr
#define  F_ResetFlag    		SysInfoFlag.bits.b4

//电量初始化标志位
#define  SetPercentInit    		SysInfoFlag.bits.b5 = Set
#define  ClrPercentInit			SysInfoFlag.bits.b5 = Clr
#define  F_PercentInit 			SysInfoFlag.bits.b5

//10ms计时标志位
#define  SetFlag10ms      		SysInfoFlag.bits.b6 = Set
#define  ClrFlag10ms      		SysInfoFlag.bits.b6 = Clr
#define  F_Cnt10ms       		SysInfoFlag.bits.b6

//开关机状态标志位
#define  SetTurnOff				SysInfoFlag.bits.b7 = Set
#define  ClrTurnOff				SysInfoFlag.bits.b7 = Clr
#define  F_TurnOff				SysInfoFlag.bits.b7

//-------------------------- 输出状态标志位 VoutInfoFlag ---------------------
//吸烟触发标志位
#define  SetEnSmoke				VoutInfoFlag.bits.b0 = Set
#define  ClrEnSmoke				VoutInfoFlag.bits.b0 = Clr
#define  F_EnSmoke				VoutInfoFlag.bits.b0

//输出中状态标志位
#define  SetLoadWork		  	VoutInfoFlag.bits.b1 = Set
#define  ClrLoadWork     		VoutInfoFlag.bits.b1 = Clr
#define  F_LoadWork    			VoutInfoFlag.bits.b1

//输出中状态标志位
#define  SetLoadWorkCh2		  	VoutInfoFlag.bits.b2 = Set
#define  ClrLoadWorkCh2    		VoutInfoFlag.bits.b2 = Clr
#define  F_LoadWorkCh2 			VoutInfoFlag.bits.b2

//电池低压标志位
#define  SetLowBat	       		VoutInfoFlag.bits.b3 = Set
#define  ClrLowBat	       		VoutInfoFlag.bits.b3 = Clr
#define  F_LowBat        		VoutInfoFlag.bits.b3


#define  SetheatPwmReg			VoutInfoFlag.bits.b4 = Set
#define  ClrheatPwmReg			VoutInfoFlag.bits.b4 = Clr
#define  heatPwmRegFlag			VoutInfoFlag.bits.b4


//开路标志位
#define  SetLoadOpen      		VoutInfoFlag.bits.b5 = Set
#define  ClrLoadOpen   			VoutInfoFlag.bits.b5 = Clr
#define  F_LoadOpen    			VoutInfoFlag.bits.b5

//短路标志位
#define  SetLoadShort      		VoutInfoFlag.bits.b6 = Set
#define  ClrLoadShort	      	VoutInfoFlag.bits.b6 = Clr
#define  F_LoadShort	       	VoutInfoFlag.bits.b6

//吸烟/点火状态标志位
#define  SetFiring				VoutInfoFlag.bits.b7 = Set
#define  ClrFiring				VoutInfoFlag.bits.b7 = Clr
#define  F_Firing				VoutInfoFlag.bits.b7

//--------------------- LED显示状态标志位 LedsInfoFlag ---------------------
//数显扫描使能状态标志位
#define  SetEnSegLED      		LedsInfoFlag.bits.b4 = Set
#define  ClrEnSegLED      		LedsInfoFlag.bits.b4 = Clr
#define  F_EnSegLED   	  		LedsInfoFlag.bits.b4

//数显扫描一轮完成标志位
#define  SetScanLedOK      		LedsInfoFlag.bits.b5 = Set
#define  ClrScanLedOK      		LedsInfoFlag.bits.b5 = Clr
#define  F_ScanLedOK   	  		LedsInfoFlag.bits.b5

//跑马显示使能标志位
#define  SetEnBatLxLED        	LedsInfoFlag.bits.b3 = Set
#define  ClrEnBatLxLED       	LedsInfoFlag.bits.b3 = Clr
#define  F_EnBatLxLED     	  	LedsInfoFlag.bits.b3

//呼吸灯使能状态标志位
#define  SetNotifyLED      		LedsInfoFlag.bits.b0 = Set
#define  ClrNotifyLED      		LedsInfoFlag.bits.b0 = Clr
#define  F_NotifyLED   	  		LedsInfoFlag.bits.b0

//呼吸灯渐亮标识
#define  SetLedRise        		LedsInfoFlag.bits.b1 = Set
#define  ClrLedRise        		LedsInfoFlag.bits.b1 = Clr
#define  F_LedRise     	  		LedsInfoFlag.bits.b1

//呼吸灯渐灭标识
#define  SetLedFall        		LedsInfoFlag.bits.b2 = Set
#define  ClrLedFall        		LedsInfoFlag.bits.b2 = Clr
#define  F_LedFall     	  		LedsInfoFlag.bits.b2

//负载接入拔除呼吸灯使能标志位
// #define  SetLoadUpDnLED    		LedsInfoFlag.bits.b4 = Set
// #define  ClrLoadUpDnLED    		LedsInfoFlag.bits.b4 = Clr
// #define  F_LoadUpDnLED 	  		LedsInfoFlag.bits.b4

//预热呼吸灯使能标志位
// #define  SetPreHotLED        	LedsInfoFlag.bits.b5 = Set
// #define  ClrPreHotLED    		LedsInfoFlag.bits.b5 = Clr
// #define  F_PreHotLED 	  		LedsInfoFlag.bits.b5

//充电呼吸灯使能标志位
#define  SetChargeLED      		LedsInfoFlag.bits.b6 = Set
#define  ClrChargeLED      		LedsInfoFlag.bits.b6 = Clr
#define  F_ChargeLED   	  		LedsInfoFlag.bits.b6

//吸烟呼吸灯使能标志位
#define  SetSmokeLED       		LedsInfoFlag.bits.b7 = Set
#define  ClrSmokeLED       		LedsInfoFlag.bits.b7 = Clr
#define  F_SmokeLED    	  		LedsInfoFlag.bits.b7


//--------------------- 数显显示状态标志位 ComxSegLED ----------------------
#define	 F_bSegA1				Com1SegLED.bits.b0
#define	 F_bSegB1				Com1SegLED.bits.b1
#define	 F_bSegC1				Com1SegLED.bits.b2
#define	 F_bSegD1				Com1SegLED.bits.b3
#define	 F_bSegE1				Com1SegLED.bits.b4
#define	 F_bSegF1				Com1SegLED.bits.b5
#define	 F_bSegG1				Com1SegLED.bits.b6
	
#define	 F_bSegA2				Com2SegLED.bits.b0
#define	 F_bSegB2				Com2SegLED.bits.b1
#define	 F_bSegC2				Com2SegLED.bits.b2
#define	 F_bSegD2				Com2SegLED.bits.b3
#define	 F_bSegE2				Com2SegLED.bits.b4
#define	 F_bSegF2				Com2SegLED.bits.b5
#define	 F_bSegG2				Com2SegLED.bits.b6
#define	 F_bSegK3				Com2SegLED.bits.b7	//"%"符号

#define	 F_bSegL1				Com3SegLED.bits.b0
#define	 F_bSegKB1				Com3SegLED.bits.b1	//"1"段	 "B" 上段
#define	 F_bSegKC1				Com3SegLED.bits.b2	//"1"段	 "C" 下段
#define	 F_bSegH5				Com3SegLED.bits.b4
#define	 F_bSegH6				Com3SegLED.bits.b5
#define	 F_bSegH7				Com3SegLED.bits.b6
#define	 F_bSegK1				Com3SegLED.bits.b7	//闪电图标

#define	 F_bSegL2				Com4SegLED.bits.b0
#define	 F_bSegL3				Com4SegLED.bits.b1
#define	 F_bSegL4				Com4SegLED.bits.b2
#define	 F_bSegL5				Com4SegLED.bits.b3
#define	 F_bSegL6				Com4SegLED.bits.b4
#define	 F_bSegL7				Com4SegLED.bits.b5
#define	 F_bSegH1				Com4SegLED.bits.b6
#define	 F_bSegH2				Com4SegLED.bits.b7

			
//---------------------------- 时间设置 ---------------------------------------
#define  SleepOutTime 		    300        	//休眠时间(单位10ms)
#define  HourOutTime 		    360000      //1小时时间(单位10ms)
#define  ScanLoadTime           5     		//上下阻检测时间间隔(单位10ms)
#define  SmokeOverTimeKey       1500   		//按键吸烟超时时间(单位10ms)
#define  SmokeOverTimeMic       1000   		//咪头吸烟超时时间(单位10ms)
#define  ScanBatLxTime          10     		//电量更新检测时间间隔(单位10ms)

#define	 OilTimePerUnit			200UL
#define	 OilTime_75_100			(OilTimePerUnit*75)
#define	 OilTime_66_100			(OilTimePerUnit*6667/100)
#define	 OilTime_50_100			(OilTimePerUnit*50)
#define	 OilTime_33_100			(OilTimePerUnit*3333/100)
#define	 OilTime_25_100			(OilTimePerUnit*25)
#define	 OilTime_100_100		(OilTimePerUnit*100)//(OilTimePerUnit*100+5000UL)

#define	 OilTime_L3				(OilTimePerUnit*275)
#define	 OilTime_L2				(OilTimePerUnit*510)
#define	 OilTime_L1				(OilTimePerUnit*510)

/**************************** USER CODE END Private defines ******************/


/******************************************************************************
 *******
 *******  					函数声明
 *******
*******************************************************************************/
void  IdleProgress(void);   //休眠模式
void  PowerProgress(void);
void  PlugProgress(void);   
void  EnterSleep(void);




#endif