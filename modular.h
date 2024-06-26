/******************************************************************************
 ** Define to prevent recursive inclusion
 ******************************************************************************/
#ifndef  _MODULAR_H_
#define  _MODULAR_H_


/**************************** USER CODE BEGIN Private typedef ****************/
//----------------------- 接入/拔除负载相关变量数据类型重定义 -------------------
typedef  struct
{
    unsigned char   LoadOld;   			//负载旧状态
	unsigned char   LoadNew;   			//负载新状态
	unsigned char   LoadCnt;   			//上下阻检测计数
	unsigned char   LoadNum;   			//上下阻次数
	unsigned char   LoadTime;   		//上下阻计时
}RunLoad_TypeDef;

//----------------------- 模拟PWM输出相关变量数据类型重定义 --------------------
typedef  struct
{
	unsigned char   BuckPwmCycleCnt;   	//斩波模拟PWM计数
	unsigned char   BuckPwmDuty;   		//斩波模拟PWM占空比
	unsigned char   BuckPwmDutyBuff;   	//斩波模拟PWM占空比缓存
	unsigned char   BuckPwmDuty_CH2;   		//斩波模拟PWM占空比
	unsigned char   BuckPwmDutyBuff_CH2;	//斩波模拟PWM占空比缓存
}RunPWM_TypeDef;

/**************************** USER CODE END Private typedef ******************/


/******************************************************************************
 **	Global variables with extern
 ******************************************************************************/
extern	RunLoad_TypeDef			RunLoad;
extern	RunPWM_TypeDef			RunPWM;


/**************************** USER CODE BEGIN Private defines ****************/
//---------------------------- 电池电量相关 -----------------------------------
#define	 BatteryPercentMax		100

//---------------------------- 斩波输出PWM周期，变化级数 -----------------------
#define  BuckPwmCycle         	200	 //周期时间=BuckPwmCycle*定时器中断时间
#define  BuckPwmMinCycle        60	 //输出周期最小时间
#define	 OUT_PWM_100_TIME		2	 //斩波输出前的直通输出时间

/**************************** USER CODE END Private defines ******************/


/******************************************************************************
 *******
 *******  					函数声明
 *******
 ******************************************************************************/
unsigned int  HAL_ADC_Sample(unsigned char ADC_CHx,unsigned char Filter);
void  UpdateElectricityGrade(void);
unsigned int  ReadLoadRes(void);
void  ScanLoadUpDown(void);
void  SmokeOut(void);

void  MCU_I2C_Start(void);
void  MCU_I2C_Stop(void);
void  MCU_I2C_WriteByte(unsigned char s_data);




#endif