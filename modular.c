/******************************************************************************
 **	Function :	modular.c 文件
 ******************************************************************************/


/******************************************************************************
 ** Include files
 ******************************************************************************/
// #include 	<pic.h>
#include 	<htc.h>
#include  	"Func.h"
#include  	"init.h"	
#include  	"modular.h"
#include  	"LED.h"


/******************************************************************************
 ** Global variable definitions (declared in header file with 'extern')
 ******************************************************************************/
RunPWM_TypeDef		RunPWM;
// RunLoad_TypeDef		RunLoad;
const unsigned int  D_BatVol_Table[101] = 
{
	3300,3314,3328,3342,3356,3370,3384,3398,3412,3426,	//3.0V~3.4V   0%~3%	
	3440,3450,3460,3470,3480,3490,3500,3510,3520,3530,	//3.4V~3.5V   4%~13%	
	3540,3550,3560,3570,3580,3590,3600,3610,3620,3630,	//3.5V~3.6V   14%~25%
	3640,3644,3648,3652,3656,3660,3664,3668,3672,3676,	
	3680,3684,3688,3692,3696,3700,3704,3708,3712,3716,	//3.6V~3.7V   26%~45%
	3720,3724,3728,3732,3736,3740,3744,3748,3752,3756,	
	3760,3764,3768,3772,3776,3780,3784,3788,3792,3796,	//3.7V~3.8V   46%~70%
	3800,3810,3820,3830,3840,3850,3860,3870,3880,3890,	//3.8V~3.9V   71%~80%
	3900,3910,3920,3930,3940,3950,3960,3970,3980,3990,	//3.9V~4.0V   81%~90%
	4000,4005,4010,4015,4020,4025,4030,4035,4040,4045,	
	4140												//4.0V~4.15V  90%~100%
};


/*******************************************************************************
 * \brief   unsigned int  HAL_ADC_Sample(unsigned char ADC_CHx,unsigned char Filter)
 * 			ADC采样函数
 * \param   [in]  unsigned char ADC_CHx  设置采样通道
 * \param   [in]  unsigned char Filter   选择单次还是多次滤波取平均值
 * \retval  unsigned int  ADC采样转化结果AD值
 * \note    注意参考电压(此处未改变原先设置)
 ******************************************************************************/
unsigned int  HAL_ADC_Sample(unsigned char ADC_CHx,unsigned char Filter)
{
	unsigned int   Value = 0,Value_Min = 4096,Value_Max = 0,Value_Sum = 0;
	unsigned char  i_max = 0;

	ADCTL2	&= 0xE0;	//选择ADC转换通道	
	ADCTL2 	|= ADC_CHx;

	while(1)
	{
		ADST 	= Set;	// Each times ADC start trig signal	
		while(ADST != False);   //等待转换完成
		Value	= ADCDH;
		Value <<= 4;
		Value  |= (ADCTL>>4);

		if(Value < Value_Min)	Value_Min = Value;
		if(Value >= Value_Max)	Value_Max = Value;
		Value_Sum += Value;
		
		if(Filter != False)
		{
			i_max++;
			if(i_max>=6)	break;
		}
		else 	break;	
	}

	if(Filter != False)	Value = (Value_Sum-Value_Min-Value_Max)>>2;

	return  Value;
}


/*******************************************************************************
 * \brief   void  UpdateElectricityGrade(void)
 *          更新电池电量函数.
 * \param   [in]  void
 * \retval  void
 * \note	和电池电量有关的异常闪灯和呼吸灯提示时、吸烟过程中不能更新电量等级
 ******************************************************************************/
void  UpdateElectricityGrade(void)
{
	uint8_t  temp_Percent;
	uint16_t temp_TimeUp;
	if(F_PercentInit != False)	//初始化电量完成	
	{
		/**************************************************************************/
		//** 充放电时电池电压浮动较大，需要慢速更新百分比和电池格数
		/**************************************************************************/

		if(F_Firing != False)	//吸烟时电量不变化，计时清零
		{
			GetADC.PercentAddCount = 0;	//电量增加计时清零
			GetADC.PercentSubCount = 0;	//电量下降计时清零

		}	
		else	//未吸烟时计时电量变化
		{
			if(F_Charger != False)	//未吸烟时充电计时电量增加
			{
				if((GetADC.BatteryVoltage + 20) < GetADC.BatteryVoltageOld && F_FirePercent == False)
				{ 
					GetADC.PercentAddCount = 0;	//电量增加计时清零
					GetADC.PercentSubCount++;	//检测到电压下降超过0.15V计时	
					if(GetADC.PercentSubCount >= 100)	//1S有效更新当前电量
					{
						GetADC.PercentSubCount = 0;	//电量下降计时清零
									
					}
				}			
				else	//电量 
				{
					GetADC.PercentSubCount = 0;	//电量下降计时清零

					SetFirePercent;

					if(F_BatFull == False && GetADC.BatteryVoltage < 4020)	//未充满电电量根据电压增加
					{
						if(GetADC.BatteryVoltage >= (D_BatVol_Table[GetADC.BatteryPercent]/* + 50*/))	//充电时补偿电压0.10V	
						{
							GetADC.PercentAddCount++;	//检测到电压上升计时
						}
						else
						{
							GetADC.PercentAddCount = 0;	//电压未上升电量增加计时清零
						}	
					}
					else	//充满电
					{
						GetADC.PercentAddCount++;	//电量未到100%，充满电电压不再上升，电量值根据时间继续增加到100%
					}	
				}

                if(GetADC.BatteryPercent >= 10 && GetADC.BatteryPercent < 90) temp_TimeUp = 3000;
                else    temp_TimeUp = 4000; 
				if(GetADC.PercentAddCount >= temp_TimeUp)	//每48S增加1%	//650mAH---1000mA充电 
				{
					GetADC.PercentAddCount = 0;	//电量增加计时清零,重新计时
					if(GetADC.BatteryPercent < BatteryPercentMax)	GetADC.BatteryPercent++;
						
					if(GetADC.BatteryPercent)	ClrLowBat;	//充电到电量非零时清除低压标志
				}
			}
			else	//未吸烟未充电时计时电量下降
			{
				GetADC.PercentAddCount = 0;	//电量增加计时清零

				if(GetADC.BatteryPercent >= 2)
				{
					if(GetADC.BatteryVoltage < D_BatVol_Table[GetADC.BatteryPercent])
					{
						GetADC.PercentSubCount++;	//检测到电压下降计时
					}
					else
					{
						GetADC.PercentSubCount = 0;	//电压未下降电量下降计时清零
					}

					if(GetADC.PercentSubCount >= 100)	//每1S减少1%	//600mAH
					{
						GetADC.PercentSubCount = 0;	//电量下降计时清零,重新计时

						temp_Percent = GetADC.BatteryPercent;	//电量缓存，用于下面计算电量变化值
						while(temp_Percent)
						{
							temp_Percent--;
							if(GetADC.BatteryVoltage >= D_BatVol_Table[temp_Percent])  break;
						}

						if((temp_Percent + 30) < GetADC.BatteryPercent)	
						{
							GetADC.BatteryPercent = temp_Percent;	//电量百分比超过30%	, 更新到最新百分比
						
							SetFirePercent;
						} 
					}

					
				}
				else
				{
					if(GetADC.BatteryVoltage < 3250)
					{
						GetADC.PercentSubCount++;
						if(GetADC.PercentSubCount >= 100)
						{
							GetADC.PercentSubCount = 0;
							GetADC.BatteryPercent = 0;	//3.25V以下才允许电量归零
							
							SetFirePercent;
						}
					}
					else
					{
						GetADC.PercentSubCount = 0;
						if(GetADC.BatteryVoltage < 3300 )
						{
							GetADC.BatteryPercent = 0;	//3.35V以下，吸烟口数超过10口(2S每口)
							
							SetFirePercent;
						}						
					}						
				}
			}
		}
	}
	else	//快速初始化百分比和电池格数
	{
		if(RunEventLED.EmEvent != PowerOnReset)
		{
			SetPercentInit;
			GetADC.PercentAddCount = 0;
			GetADC.PercentSubCount = 0;
			SetFirePercent;	
			for(GetADC.BatteryPercent = 0;GetADC.BatteryPercent<BatteryPercentMax;GetADC.BatteryPercent++)
			{
				if(GetADC.BatteryVoltageOld < D_BatVol_Table[GetADC.BatteryPercent])  break;			
			}

			GetADC.BatteryLevel = GetADC.BatteryPercent;	//保存显示的电量
		}
		else
		{
			GetADC.BatteryVoltageOld = GetADC.BatteryVoltage;
		}	
	}		
}


/*******************************************************************************
 * \brief   unsigned int  ReadLoadRes(void)
 *          获取负载阻值函数.
 * \param   [in]  void
 * \retval  负载阻值
 * \note	检测电路打开没有延时，采用开始几次采样值丢掉当作延时。	
 ******************************************************************************/
#if  1
unsigned int  ReadLoadRes(void)   
{  
	unsigned int  LoadValue = 0;

	PAMOD54	= PAMOD54 & 0x0F | PIN_H_Mode_ADC;	//AD_OUT切换回模拟口
	TEST_LOAD_ON;	//开启检测电路
	LoadValue = HAL_ADC_Sample(ADC_CH_VOUT,True);	//延时丢掉采样值，等待稳定
	LoadValue = HAL_ADC_Sample(ADC_CH_VOUT,True);
	TEST_LOAD_OFF;	//检测完成关闭检测电路
	PAMOD54	= PAMOD54 & 0x0F | PIN_H_Mode_OD_WAKEUP;
	GPIO_LOAD = Set;	//AD_OUT切换回数字IO	

	if(LoadValue >= 4090)	LoadValue = 0xFFFF;	//开路
	else if(LoadValue < 30)	LoadValue = 0;    //短路
	else	LoadValue = ((unsigned long)LoadValue*Rref_VOUT)/(4096-LoadValue);

	return  LoadValue;    
}
#endif   


/*******************************************************************************
 * \brief   void  SmokeOut(void)
 *          模拟PWM控制输出函数。
 * \param   [in]  void
 * \retval  void
 * \note	降压斩波输出;根据中断时间注意溢出可包含中断短路检测。
 ******************************************************************************/					

void  SmokeOut( void )
{
    if( RunPWM.BuckPwmCycleCnt >= BuckPwmCycle )     //BuckPwmCycle=200
    {
        RunPWM.BuckPwmCycleCnt = 0;
        RunPWM.BuckPwmDuty = RunPWM.BuckPwmDutyBuff;
        RunPWM.BuckPwmDuty_CH2 = RunPWM.BuckPwmDutyBuff_CH2;

        if( RunPWM.BuckPwmDuty )  PWMPD_ON;
        else    PWMPD_OFF;

        if( RunPWM.BuckPwmDuty_CH2 )  PWMPD_CH2_ON;
        else    PWMPD_CH2_OFF;
    }
    else if( RunPWM.BuckPwmCycleCnt )
    {
        if( RunPWM.BuckPwmCycleCnt == RunPWM.BuckPwmDuty )
        {
            PWMPD_OFF;
        }

        if( RunPWM.BuckPwmCycleCnt == RunPWM.BuckPwmDuty_CH2 )
        {
            PWMPD_CH2_OFF;
        }
    }


    if( RunPWM.BuckPwmCycleCnt == 5 )
    {
        SetheatPwmReg;
    }
    RunPWM.BuckPwmCycleCnt++;
}

/*******************************************************************************
 * \brief   void  ScanLoadUpDown(void)
 *          接入/拔除负载检测函数.
 * \param   [in]  void
 * \retval  void
 * \note
 ******************************************************************************/
#if 0
void  ScanLoadUpDown(void)     
{
	if(F_Firing == False)	//未吸烟时检测负载状态
	{
		if(LOAD_DOWN)   RunLoad.LoadNew = Set;   //加载负载 
		else   			RunLoad.LoadNew = Clr;   //移走负载 
	}

	if(RunLoad.LoadTime)	RunLoad.LoadTime--;
	else	RunLoad.LoadNum = 0;	//连续插拔负载次数清零     
 
	if(RunLoad.LoadOld != RunLoad.LoadNew)    //检测到上下阻
	{
		if(RunLoad.LoadCnt < ScanLoadTime)	RunLoad.LoadCnt++;
		else
		{
			RunLoad.LoadOld = RunLoad.LoadNew;	//更新负载状态
			RunLoad.LoadCnt = 0;
			
			if(RunLoad.LoadOld)	//接入负载处理
			{
				RunLoad.LoadNum++;
				RunLoad.LoadTime = 70;		//2S内3次
				TimeCnt.SmokeTime = 0x00;	//总吸烟时长清0	//接入烟弹，油量重新计算
			}
		}		
	}
	else	RunLoad.LoadCnt = 0;

	if(RunLoad.LoadNum)		TimeCnt.SleepTime = 0;	//连续插拔负载状态更新休眠时间	
}
#endif


/*******************************************************************************
 * \brief   void  MCU_I2C_Start(void)	
 * 			IIC总线产生起始信号
 * \param   [in]  void
 * \retval  void
 * \note    在时钟线为高电平时，拉低数据线  
 ******************************************************************************/
#if I2Cx_EN
void  MCU_I2C_Start(void)				
{
	SET_I2C_SCL;	//拉高时钟线
	SET_I2C_SDA;	//拉高数据线
	_nop_();
	_nop_();
	CLR_I2C_SDA;	//在时钟线为高电平时，拉低数据线，产生起始信号
	_nop_();
	_nop_();	
	CLR_I2C_SCL;	//拉低时钟线准备传输数据
//	_nop_();
//	_nop_();	
}
#endif


/*******************************************************************************
 * \brief   void  MCU_I2C_Stop(void)
 * 			IIC总线产生停止信号
 * \param   [in]  void
 * \retval  void
 * \note    时钟时线为高电平时，拉高数据线  
 ******************************************************************************/
#if I2Cx_EN
void  MCU_I2C_Stop(void) 	
{
	SET_I2C_SCL;	//拉高时钟线
	CLR_I2C_SDA;	//拉低数据线
	_nop_();
	_nop_();	
	SET_I2C_SDA;	//时钟时线为高电平时，拉高数据线，产生停止信号。
//	_nop_();
//	_nop_();
}
#endif


/*******************************************************************************
 * \brief   void  MCU_I2C_WriteByte(unsigned char s_data)
 * 			向IIC总线写入一个字节的数据
 * \param   [in]  s_data   需要发送的8位数据
 * \retval  void
 * \note    无论应答位接收到1还是0，默认收到应答位
 * 			本身拉低时钟线的时间比拉高的时间长，改为do~while ，增加时钟线高电平时间 
 ******************************************************************************/
#if I2Cx_EN
void  MCU_I2C_WriteByte(unsigned char s_data)
{
	unsigned char  i = 0,Ack_timeout = 0;
      	
	do{  
		if(s_data&0x80)		SET_I2C_SDA;	//高位在前	//发送‘1’
		else				CLR_I2C_SDA;	//发送‘0’
        SET_I2C_SCL;	//拉高时钟线，将数发送到IIC总线      
        s_data <<= 1;	//数据左移一位，把次高位放在最高位,为写入次高位做准备 
		i++;
//		_nop_();
//		_nop_();		
        CLR_I2C_SCL;	//拉低时钟线，准备接收下一位数据
//		_nop_();
//		_nop_();
    }while(i<8) ;	//有8位数据
 
	//释放总线,开始接收应答位             
    SET_I2C_SCL;
	_nop_();
	_nop_();
	while(GPIO_I2C_SDA && Ack_timeout<100)
	{
		Ack_timeout++;
	}	//等待应答或超时	
    CLR_I2C_SCL;
//	_nop_();
//	_nop_();
}
#endif













