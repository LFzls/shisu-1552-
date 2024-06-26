/******************************************************************************
 ** Function :	task.c 文件
 ******************************************************************************/


/******************************************************************************
 ** Include files
 ******************************************************************************/
// #include 	<pic.h>
#include 	<htc.h>
#include  	"Func.h"
#include  	"init.h"
#include  	"key.h"
#include  	"modular.h"
#include  	"LED.h"


/******************************************************************************
 ** Global variable definitions (declared in header file with 'extern')
 ******************************************************************************/


/*******************************************************************************
 * \brief   void  IdleProgress(void)
 *          休眠\空闲模式入口函数。
 * \param   [in]  void
 * \retval  void
 * \note	上次休眠时中断中计时时间不确定，唤醒后等待20ms让外设工作稳定
 ******************************************************************************/
void  IdleProgress(void)   
{
	if(RunEventLED.EmEvent == IdleLED && F_ScanLedOK != False && F_PercentInit != False)
	{					
		EnterSleep(); 
		TimeCnt.SleepTime = 2;	//延时20ms等待外设稳定
		while(TimeCnt.SleepTime)
		{
			if(F_Cnt10ms != False)	//10ms执行一次
			{
				ClrFlag10ms;	
				asm("CLRWDT");	//清看门狗		
				TimeCnt.SleepTime--;
			} 
		}
		SetExeMode;			
	}	
}


/*******************************************************************************
 * \brief   void  EnterSleep(void)
 *          进入休眠函数。
 * \param   [in]  void
 * \retval  void
 * \note	系统可设置休眠时关闭外设时钟、PWRSAV关闭LVR降低功耗
 * 			第一次进入更新负载状态；有充电器插入则不休眠。
 ******************************************************************************/
void  EnterSleep(void)
{
	if(F_ResetFlag != False)	
	{
		ClrResetFlag;	//上电闪完灯后更新负载初始化状态

		/*if(LOAD_DOWN)
		{
			RunLoad.LoadOld = Set;
			RunLoad.LoadNew = Set;   //加载负载 
		}
		else
		{
			RunLoad.LoadOld = Clr;
			RunLoad.LoadNew = Clr;   //移走负载
		}*/				
	}	

	if(CHARGER_IN || CHRG_STATE_DOWN)	return;	//充电器未拔出退出休眠

	//进入休眠	//初始化时LVD、LVR、WDT已设置STOP模式时禁止
	TIMER0_DISABLE;TIMER1_DISABLE;TIMER2_DISABLE;	//关闭定时器
#if	PWMx_EN
	PWMx_DISABLE;	//stop PWM
#endif	
	InitGpio(); 	//重新初始化GPIO,关闭外设	
	INTIE	= 0x00;
	INTIE1	= 0x00;	//先禁止所有中断
	
	STPSCK_OPEN;	//停止慢时钟源
	Delay_16nop();		
	asm("sleep");   //掉电模式，进入休眠	//ENTER_STOP_MODE;	//进入STOP模式
	STPSCK_OFF;		//唤醒后使能慢时钟。
	Delay_16nop();	
	
	Init_BOD_WDT();    //唤醒后使能WDT、BOD中断 	
	InitGpio();
#if PWMx_EN
	InitPWM((LED_DUTY_PERI_MAX-1),LED_DUTY_PERI_MAX,0x00);	//初始化灭灯PWM---RGB
#endif
	MCU_INIT_TIMER();   //唤醒后启动定时器
}


/*******************************************************************************
 * \brief   void  PowerProgress(void)
 *          未休眠\吸烟模式运行函数。
 * \param   [in]  void
 * \retval  void
 * \note	注意需要在输出时获取电池电压值，ADC检测值需保证不是在关输出时检测值
 ******************************************************************************/
void  PowerProgress(void)
{
	uint16_t  AD_Temp;

	if(F_EnSmoke != False)	//有吸烟触发 
	{
		ClrEnSmoke;
		if(RunEventLED.EmEvent < LowVol || RunEventLED.EmEvent == ChangeGears || RunEventLED.EmEvent == ShowOil /*&& RunEventLED.EmEvent != PullCharger*/)	//插拔负载提示可以吸烟	//充电显示时可吸烟
		{
			if(F_TurnOff == False /*&& F_Charger == False*/)	//未锁机    //充电不可吸烟
			{
				if(F_Firing == False)	//吸烟前
				{
					if(/*GetADC.BatteryVoltage < 3000 || */GetADC.BatteryPercent==0 || F_LowBat != False)	//吸烟前电池电压小于3.3V
					{
						SetOffNotifyLED();	//灭呼吸灯
						SetShowLED(0x00);	//灭档位灯
						LOWBAT_LED;		
						ShowSegmentLED(0x00);
						GetADC.BatteryPercent = 0;					
						// SetLowBat;
						if(RunEventLED.EmEvent == SmokeShow)
						{
							ClrEnBatLxLED;	//禁止跑马灯
							RunLED.ShowBatLxCnt = 0x00;
							RunLED.TaskBatLx = 0;	//立即更新显示
							SetShowBatLxLED(0x00);	//跑马灯灭灯
						}												
					}
					else if(LOAD_UP)	//发热丝开路
					{
						SetOffNotifyLED();	//灭呼吸灯
						SetShowLED(0x00);	//灭档位灯													
						HIGHLOAD_LED;
						ShowSegmentLED(0x00);
						ClrEnBatLxLED;	//禁止跑马灯
						RunLED.ShowBatLxCnt = 0x00;
						RunLED.TaskBatLx = 0;	//立即更新显示
						SetShowBatLxLED(0x00);	//跑马灯灭灯						
					}
					else
					{
						GetADC.LoadRes = ReadLoadRes();
						if(GetADC.LoadRes < 380)	//负载阻值小于0.4Ω
						{
							SetOffNotifyLED();	//灭呼吸灯												
							SHORT_LED;
							RunEventLED.ShowTask = 0;	//立即更新显示
							ClrEnBatLxLED;	//禁止跑马灯
							RunLED.ShowBatLxCnt = 0x00;
							RunLED.TaskBatLx = 0;	//立即更新显示
						}
						else
						{
							FlagSmoke = 0xA55A;	//置位吸烟状态中寄存器 
							LVDIF = Clr;	//clear LVD interrupt flag
							LVDIE = Set;//LVD interrupt enable	//开欠压中断
							PAMOD54	= PAMOD54 & 0x0F | PIN_H_Mode_ADC;	//AD_OUT切换回模拟口
							//CHRG_OFF;
							ReadPort.ChargerCnt = 0;
							TimeCnt.RechgFullTime = 0;	//吸烟关闭充电，检测充电状态恢复初状态
							GetADC.VoutOld = GetADC.BatteryVoltage;	//获取初始输出值
							if(F_FirePercent != False)
							{
								GetADC.BatteryVoltageOld = GetADC.BatteryVoltage;
								ClrFirePercent;
							}	

							if( GetADC.Vout_Lx == 0x80 ) //
							{
								PWMPD_ON;
								PWMPD_CH2_ON;
								RunPWM.BuckPwmDuty = RunPWM.BuckPwmDutyBuff = BuckPwmCycle;
								RunPWM.BuckPwmDuty_CH2 = RunPWM.BuckPwmDutyBuff_CH2 = BuckPwmCycle;
							}
							else if( GetADC.Vout_Lx == 0x01 )
							{
								PWMPD_ON;
								PWMPD_CH2_ON;
								RunPWM.BuckPwmDuty = RunPWM.BuckPwmDutyBuff = BuckPwmCycle;
								RunPWM.BuckPwmDuty_CH2 = RunPWM.BuckPwmDutyBuff_CH2 = BuckPwmCycle;
							}
							else    //if(GetADC.Vout_Lx == 0x00)
							{
								PWMPD_CH2_OFF;
								PWMPD_ON;
								RunPWM.BuckPwmDuty = RunPWM.BuckPwmDutyBuff = BuckPwmCycle;
								RunPWM.BuckPwmDuty_CH2 = RunPWM.BuckPwmDutyBuff_CH2 = 0;
							}



							PWMPD_ON;	//开启发热丝输出通道
							RunPWM.BuckPwmDuty = RunPWM.BuckPwmDutyBuff = BuckPwmCycle;
							RunPWM.BuckPwmCycleCnt = 0;	//延时1个BuckPwmCycle时间更新占空比，输出开始时能延时1个中断时间才检测	
							GetADC.LowVolCnt = 0;
							GetADC.VoutVDD = 0;
							ClrLoadOpen;ClrLoadWork;									
							TM0IE = Clr;
							TimeCnt.SmokeTask = 0;	//吸烟计时重新开始																													
							TimeCnt.TimeBase = 50;	//检测电池电压和输出开启时间错开5ms,保证检测电池电压总在输出打开时
							TM0IE = Set;	
							SetFiring;	//吸烟开始	
						}																			
					}
				}
			}
		}
	}
	else if(F_Firing != False)	//吸烟过程中
	{
		if(F_LoadShort != False)	//检测到短路
		{
			KeyUpStopSmoke();
			SetOffNotifyLED();	//灭呼吸灯												
			SHORT_LED;
			RunEventLED.ShowTask = 0;	//立即更新显示
			ClrEnBatLxLED;	//禁止跑马灯
			RunLED.ShowBatLxCnt = 0x00;
			RunLED.TaskBatLx = 0;	//立即更新显示
		}
		else if(GetADC.LowVolCnt >= 10)	//检测到低压
		{
			KeyUpStopSmoke();
			SetOffNotifyLED();	//灭呼吸灯
			SetShowLED(0x00);	//灭档位灯
			LOWBAT_LED;		
			ShowSegmentLED(0x00);
			GetADC.BatteryPercent = 0;
			ClrEnBatLxLED;	//禁止跑马灯
			RunLED.ShowBatLxCnt = 0x00;
			RunLED.TaskBatLx = 0;	//立即更新显示
			SetShowBatLxLED(0x00);	//跑马灯灭灯			
			// SetLowBat;
		}	
		else if(TimeCnt.SmokeTask >= SmokeOverTimeMic && (ReadPort.KeyState&0x80) == 0)	//正常吸烟超时
		{
			KeyUpStopSmoke();
			SetOffNotifyLED();	//灭呼吸灯
			SetShowLED(0x00);	//灭档位灯		
			TIMEOUT_LED;
			ShowSegmentLED(0x00);
			ClrEnBatLxLED;	//禁止跑马灯
			RunLED.ShowBatLxCnt = 0x00;
			RunLED.TaskBatLx = 0;	//立即更新显示
			SetShowBatLxLED(0x00);	//跑马灯灭灯				
		}
		else if(TimeCnt.SmokeTask >= SmokeOverTimeKey && (ReadPort.KeyState&0x80) != 0)	//预热超时
		{
			KeyUpStopSmoke();
			SetOffNotifyLED();	//灭呼吸灯
			SetShowLED(0x00);	//灭档位灯
			IDLE_LED; 
			ShowSegmentLED(0x00);
			ClrEnBatLxLED;	//禁止跑马灯
			RunLED.ShowBatLxCnt = 0x00;
			RunLED.TaskBatLx = 0;	//立即更新显示
			SetShowBatLxLED(0x00);	//跑马灯灭灯						
		}
		else
		{
			if(F_LoadWork != False)	//有输出时才检测
			{




				GetADC.LoadRes = HAL_ADC_Sample(ADC_CH_VOUT,False);

				if(F_LoadWork != False)	//检测过程中没有关掉输出
				{			
					if(F_LoadOpen != False)	//获取到初始输出值
					{					
						if(GetADC.LoadRes < 3800)	//此处值根据MOS实际调整
						{
							SetLoadShort;				
							PWMPD_OFF;  //短路关输出
						}
						else 
						{				
							if(GetADC.VoutVDD)	//检测到正确VDD电压才计算
							{	
								//VoutGears:设置电压  	BuckPwmCycle:设置的最大占空比  
								//GetADC.VoutVDD:电池电压AD值 GetADC.LoadRes:输出端AD值 1.20:基准电压
								// 恒功率：P0*R*BuckPwmCycle*1000000 = 12000*1000*200  //1.0R  12W
								// 恒压  ：U0*BuckPwmCycle*4096000 = 3600*4096*200
					
								//VOUT(直通输出电压)=VDD(电池电压)*AD_OUT(直通输出电压AD值)/4096  
								//DUTY(目标占空比,平均值)=V0(目标电压)*BuckPwmCycle(输出PWM周期)/VOUT(直通输出电压)						
								//DUTY(目标占空比,有效值)=V0(目标电压)*V0(目标电压)*BuckPwmCycle(输出PWM周期)/(VOUT(直通输出电压)*VOUT(直通输出电压))

								AD_Temp = ((uint32_t)GetADC.LoadRes*GetADC.VoutVDD)/4096;

								switch (GetADC.Vout_Lx)
								{
									case 0x00:
										AD_Temp=640000UL/AD_Temp; //12W：0.8ohm 交替工作，5口切换，3.2V 平均值输出；
										break;
									case 0x01:
										AD_Temp=540000UL/AD_Temp;  //18W：0.8ohm x 2 并联工作，2.7V 平均值输出；
										break;
									case 0x80:
										GetADC.Vout_Lx = 640000UL; // 25W：0.8ohm x 2 并联工作，3.2V 平均值输出；
										break;
								}
							

								if(AD_Temp>=BuckPwmCycle)  
									RunPWM.BuckPwmDutyBuff = BuckPwmCycle;
								else if(AD_Temp < BuckPwmMinCycle)	
									RunPWM.BuckPwmDutyBuff = BuckPwmMinCycle;							
								else	
									RunPWM.BuckPwmDutyBuff = AD_Temp;



							}									
						}
					}
					else
					{
						if(GetADC.LoadRes < 3810)	
						{
							SetLoadShort;				
							PWMPD_OFF;  //短路关输出
						}							
						else
						{
							SetLoadOpen;															
							GetADC.VoutOpenCnt = 0;
							ClrNotifyLED;
							ClrChargeLED;
							ClrLedFall;
							SetLedRise;   	//置位呼吸灯渐亮
							if(F_SmokeLED == False)
							{
								RunLED.NotifyLedDuty = 0;  	//呼吸灯重新开始
								ClrEnBatLxLED;	//禁止跑马灯
								RunLED.ShowBatLxCnt = 0x00;
								RunLED.TaskBatLx = 0;	//立即更新显示									
							}	
							SetSmokeLED;	//吸烟呼吸灯						
							SetNotifyLED;
							SetEnBatLxLED;
							SMOKE_LED;	//输出显示
							GetADC.BatteryLevel = GetADC.BatteryPercent;	//保存显示的电量	
							RunEventLED.ShowTask = OUT_PWM_100_TIME;	//立即更新显示																
						}
					}
				}			
			}		
		}
	}
}


/*******************************************************************************
 * \brief   void  PlugProgress(void)
 *          充电过程函数。
 * \param   [in]  void
 * \retval  void
 * \note	充满判断根据电池电压4.1V±0.03V	(无状态脚判断);
 * 			有状态脚判断：状态脚高电平+电池电压高于4.1V
 * 			充满电灭灯，无复充过程。
 ******************************************************************************/
void  PlugProgress(void)
{
	if(F_Charger != False)       
	{
		if(RunEventLED.EmEvent == IdleLED)
		{
			USBIN_LED;
			RunLED.ShowEventOld = 0x00;
			RunEventLED.ShowTask = 0;	//立即更新显示
			SetEnBatLxLED;	//跑马灯
		}	

		if(F_BatFull == False)	//未充满电 
		{
			if(GetADC.BatteryVoltage >= 3950)
			{
				if(GetADC.BatteryVoltage >= 4220 || CHRG_STATE_UP  || GetADC.BatteryPercent >= BatteryPercentMax)	//电池电压>4.20V 或状态脚变高电平
				{
					if(TimeCnt.RechgFullTime < 20)	TimeCnt.RechgFullTime++;
					else	//持续2S有效
					{
						TimeCnt.RechgFullTime = 0;
						SetBatFull;					
					}
				}
				else	TimeCnt.RechgFullTime = 0;
			}   
			else	TimeCnt.RechgFullTime = 0;
		}
		else
		{
			if(RunEventLED.EmEvent == Rechg && GetADC.BatteryPercent == BatteryPercentMax)
			{
				FULLBAT_LED;			
				GetADC.BatteryLevel = GetADC.BatteryPercent;	//保存显示的电量
				RunEventLED.ShowTask = 0;	//立即更新显示
				TimeCnt.RechgFullTime = 0;
				ClrEnBatLxLED;	//禁止跑马灯
				RunLED.ShowBatLxCnt = 0x00;
				RunLED.TaskBatLx = 0;	//立即更新显示						
			}
		}	
	}
	else	
	{
		if(RunEventLED.EmEvent == IdleLED && F_NotifyLED == False)
		{
			if(TimeCnt.SleepTime<SleepOutTime)	TimeCnt.SleepTime++;
			else	ClrExeMode;     //休眠时间到转休眠模式
		}	
	}													     	
}