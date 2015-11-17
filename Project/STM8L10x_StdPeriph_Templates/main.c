/**
  ******************************************************************************
  * @file    Project/STM8L15x_StdPeriph_Template/main.c
  * @author  MCD Application Team
  * @version V1.6.0
  * @date    28-June-2013
  * @brief   Main program body
  ******************************************************************************
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */  
	
/* Includes ------------------------------------------------------------------*/
#include "board.h"
#include "config.h"
#include "delay.h"


/** @addtogroup STM8L15x_StdPeriph_Template
  * @{
  */

/* Private define ------------------------------------------------------------*/
/* Private typedef -----------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
static bool FLAG_Battery_Low = FALSE;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
extern u8 Btn_pressed;
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
  disableInterrupts();
  Config();
  enableInterrupts();
    
  /* Stop used peripheral clocks */
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);  
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
  LED_OFF;
  /* go to HALT mode */
  halt();
  /* Infinite loop */
  while (1)
  {
    CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv4);    // Set System Clock to 4Mhz
    
    CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
    TIM4_TimeBaseInit(TIM4_Prescaler_16, 0xFF);  // 4us delay timebase
    CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
    TIM2_Cmd(ENABLE);
    disableInterrupts();
    
    TIM2->CCER1 |= TIM_CCER1_CC1E;  // enable PWM output
    delay_tim4(119);
    TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);  // disable PWM output
    if(Btn_pressed == 0)
    {
      delay_tim4(250);
      delay_tim4(250);
      delay_tim4(250);
      delay_tim4(250);
      delay_tim4(250);
      delay_tim4(100);
    }
    else
    {
      delay_tim4(250);
      delay_tim4(250);
      delay_tim4(250);
      delay_tim4(250);
      delay_tim4(250);
      delay_tim4(250);
      delay_tim4(250);
      delay_tim4(101);
    }
    TIM2->CCER1 |= TIM_CCER1_CC1E;  // enable PWM output
    delay_tim4(119);
    TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);  // disable PWM output
    TIM2_Cmd(DISABLE);
    
    enableInterrupts();
    
    LED_ON;
    delay_tim4(80);
    LED_OFF;
    
    /* Stop used peripheral clocks */
    CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);  
    CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
    LED_OFF;
    /* go to HALT mode */
    halt();
  }
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
