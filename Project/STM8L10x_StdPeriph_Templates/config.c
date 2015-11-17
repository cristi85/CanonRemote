#include "board.h"

void Config()
{
  CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv4);
  //System clock at power up is HSI/8 = 16MHz/8 = 2MHz
  //CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_4);  //set HSI/4 = 4MHz SysClk to Core and Memory, minimum clock = 125KHz for CLK_SYSCLKDiv_128
  //PWR_PVDCmd(ENABLE);  //Power voltage detector and brownout Reset unit supply current 2,6uA
  //PWR_PVDLevelConfig(PWR_PVDLevel_2V26); //set Programmable voltage detector threshold to 2,26V
  //PWR_GetFlagStatus(PWR_FLAG_PVDOF);  //checks whether the specified PWR flag is set or not
  
  //Configure external interrupts - BTN1 and BTN2 presses
  EXTI_SetPinSensitivity(EXTI_Pin_0 | EXTI_Pin_1, EXTI_Trigger_Falling_Low);
  //EXTI_SelectPort(EXTI_Port_B);
  //EXTI_SetHalfPortSelection(EXTI_HalfPort_B_MSB, ENABLE);
  
  // Timer 4 Configuration
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);   // 8bit: used for delay calculation, IDD(TIM4) = 3uA/MHz
  TIM4_TimeBaseInit(TIM4_Prescaler_16, 0xFF);  // 4us timebase
  //TIM4_InternalClockConfig();
  
  // Timer 2 Configuration
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
  TIM2_TimeBaseInit(TIM2_Prescaler_1, TIM2_CounterMode_Up, 61);
  TIM2_OC1Init(TIM2_OCMode_Toggle,
               TIM2_OutputState_Enable,
               30,
               TIM2_OCPolarity_Low,
               TIM2_OCIdleState_Reset);
  TIM2->BKR = 0xA0;
  TIM2_Cmd(DISABLE);
  
  //Set all GPIO pins to PP Low (Low power mode)
  GPIO_Init(GPIOA, GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(GPIOD, GPIO_Pin_0, GPIO_Mode_Out_PP_Low_Slow);
  
  /* Output PP High - onboard LED to GND */
  GPIO_Init(LED_PORT, LED_PIN, GPIO_Mode_Out_PP_Low_Slow);

  /* Input pull up no IT - onboard Button, external pull-up */
  GPIO_Init(BTN_PORT, BTN1_PIN, GPIO_Mode_In_FL_IT);
  GPIO_Init(BTN_PORT, BTN2_PIN, GPIO_Mode_In_FL_IT);
  
  /* Output PP Low - Send RF data to RF emitter */
  //GPIO_Init(RFSEND_PORT, RFSEND_PIN, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(IRLED_PORT, IRLED_PIN, GPIO_Mode_Out_PP_High_Fast);
  
}