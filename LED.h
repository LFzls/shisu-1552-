/******************************************************************************
 **	Define to prevent recursive inclusion
 ******************************************************************************/
#ifndef   _LED_H
#define   _LED_H


/**************************** USER CODE BEGIN Private typedef ****************/
typedef struct 
{
	unsigned char   NotifyLedCycleCnt;		//呼吸灯周期计数
	unsigned char   NotifyLedDuty;			//呼吸灯占空比
	unsigned char   NotifyLedCycle;     	//呼吸灯周期

	unsigned char	DisplayCnt;
	unsigned char	ShowEventOld;
	unsigned char	ShowBatLxCnt;			//显示跑马等级计数
	unsigned char	TaskBatLx;				//显示跑马计时
}LED_TypeDef;

typedef struct 
{
	unsigned char   ShowTime;		//显示有效时长
    unsigned char   FlashTimes;	   	//闪烁次数*2
	unsigned char   ShowTask;		//显示计时
    unsigned char	EmEvent;	 	//运行事件枚举
}RunEvent_TypeDef;

/**************************** USER CODE END Private typedef ******************/


/******************************************************************************
 **	Global variables with extern
 ******************************************************************************/
extern	LED_TypeDef    			RunLED;     
extern	RunEvent_TypeDef    	RunEventLED;
extern	RunEvent_TypeDef    	RunEventBuzz;


/**************************** USER CODE BEGIN Private defines ****************/
//-------------------------------- RGB灯显设置 -------------------------------
#define  LED_DUTY_PERI_MAX      255
//#define  NotifyLedCycle		71		//500ms渐亮/渐灭时间 71

//-------------------------------- RGB灯色设置 -------------------------------
#define	 RGB_LEDS_OFF()			Set_RGB_LED(0,0,0)			//灭灯	
#define	 RGB_WLED_ON()			Set_RGB_LED(255,255,255)	//全亮,白灯
#define	 RGB_RLED_ON()			Set_RGB_LED(255,0,0)		//红灯
#define	 RGB_GLED_ON()			Set_RGB_LED(0,255,0)		//绿灯
#define	 RGB_BLED_ON()			Set_RGB_LED(0,0,255)		//蓝灯
#define	 RGB_YLED_ON()			Set_RGB_LED(255,255,0)		//黄灯
#define	 RGB_PLED_ON()			Set_RGB_LED(255,0,255)		//紫灯
#define	 RGB_OLED_ON()			Set_RGB_LED(255,64,0)		//橙灯

#define  Red_color				0x01	//红色
#define  Green_color			0x02	//绿色
#define  Blue_color				0x04	//蓝色
#define  White_color			0x07	//白色
#define  Purple_color			0x05	//紫色
#define  Cyan_color				0x06	//青色
#define  Yellow_color			0x03	//黄色


//--------------------------- 异常提示闪灯类型 --------------------------------
#define	 IdleBuzz				0    	//蜂鸣器空闲

#define	 IdleMotor				0    	//马达空闲

#define	 IdleLED				0		//空闲
#define	 PowerOnReset			16    	//上电提示
#define	 PowerOn				12    	//开机提示
#define	 PowerOff				11    	//关机提示
#define	 LowRes					14		//低阻或短路提示
#define	 HighRes				13		//高阻或开路提示
#define	 ChangeLoad				1		//接入/拔除负载提示
#define	 ChangeGears			10		//调节输出档位提示
#define	 OverTime				15		//超时提示
#define	 LowVol					7		//低压提示
#define	 Rechg					4		//接入充电适配器提示
#define	 PullCharger			6		//拔除充电适配器提示
#define	 RechgFull				5		//充满电提示
#define	 PushLoad				2		//接入负载提示
#define	 PullLoad				3		//拔除负载提示
#define	 SmokeShow				1		//吸烟提示
#define	 NoOil				    9		//油量空提示
#define	 ShowOil				17		//油量、电量、档位显示


#define  RESET_LED           	SetWarnEvent(&RunEventLED,PowerOnReset,25,16)
#define  SMOKE_LED         		SetWarnEvent(&RunEventLED,SmokeShow,25,200) 
#define  LOWBAT_LED         	SetWarnEvent(&RunEventLED,LowVol,25,20) 
#define  TIMEOUT_LED			SetWarnEvent(&RunEventLED,OverTime,25,4)
#define  SHORT_LED         		SetWarnEvent(&RunEventLED,LowRes,25,8)
#define  USBOUT_LED				SetWarnEvent(&RunEventLED,PullCharger,25,8)
#define  USBIN_LED 				SetWarnEvent(&RunEventLED,Rechg,25,20)
#define  NO_OIL_LED         	SetWarnEvent(&RunEventLED,NoOil,25,8)
#define  SHOW_OIL_LED         	SetWarnEvent(&RunEventLED,ShowOil,25,8)

#define  POWERON_LED         	SetWarnEvent(&RunEventLED,PowerOn,25,10)
#define  POWEROFF_LED         	SetWarnEvent(&RunEventLED,PowerOff,25,10)
#define  HIGHLOAD_LED      		SetWarnEvent(&RunEventLED,HighRes,25,4)
#define  CHANGE_LOAD_LED   		SetWarnEvent(&RunEventLED,ChangeLoad,25,40)
#define  CHANGEGEAR_LED			SetWarnEvent(&RunEventLED,ChangeGears,25,6)
#define  FULLBAT_LED			SetWarnEvent(&RunEventLED,RechgFull,25,40)
#define  IDLE_LED				SetWarnEvent(&RunEventLED,IdleLED,25,0)
#define  PUSH_LOAD_LED			SetWarnEvent(&RunEventLED,PushLoad,25,40)
#define  PULL_LOAD_LED			SetWarnEvent(&RunEventLED,PullLoad,25,40)
#define  HIGHLOAD_2CH_LED  		SetWarnEvent(&RunEventLED,HighRes2xCh,25,8)

/**************************** USER CODE END Private defines ******************/


/******************************************************************************
 *******
 *******  					函数声明
 *******
 ******************************************************************************/
void  Set_RGB_LED(unsigned char R_DUTY,unsigned char G_DUTY,unsigned char B_DUTY);
void  SetShowLED(unsigned char LED_color);
void  SetWarnEvent(RunEvent_TypeDef *EmRunEvent,unsigned char WarnEvent,unsigned char WarnShowTime,unsigned char WarnShowCnt); 
void  ShowWarnLED(void);        //警告灯显示
void  ShowWarnBuzz(void);		//蜂鸣器提示
void  ShowNotifyLED(void);      //呼吸灯
void  SetOffNotifyLED(void);
void  ScanSegmentLED(void);
void  ShowSegmentLED(unsigned char ShowEvent);
void  SetShowBatLxLED(unsigned char ShowBatLx);
void  ScanShowBatLxLED(void);




#endif




