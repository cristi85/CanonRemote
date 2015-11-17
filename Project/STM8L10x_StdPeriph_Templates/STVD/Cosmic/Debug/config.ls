   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  57                     ; 3 void Config()
  57                     ; 4 {
  59                     .text:	section	.text,new
  60  0000               _Config:
  64                     ; 5   CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv4);
  66  0000 a602          	ld	a,#2
  67  0002 cd0000        	call	_CLK_MasterPrescalerConfig
  69                     ; 13   EXTI_SetPinSensitivity(EXTI_Pin_0 | EXTI_Pin_1, EXTI_Trigger_Falling_Low);
  71  0005 ae0200        	ldw	x,#512
  72  0008 cd0000        	call	_EXTI_SetPinSensitivity
  74                     ; 18   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);   // 8bit: used for delay calculation, IDD(TIM4) = 3uA/MHz
  76  000b ae0401        	ldw	x,#1025
  77  000e cd0000        	call	_CLK_PeripheralClockConfig
  79                     ; 19   TIM4_TimeBaseInit(TIM4_Prescaler_16, 0xFF);  // 4us timebase
  81  0011 ae04ff        	ldw	x,#1279
  82  0014 cd0000        	call	_TIM4_TimeBaseInit
  84                     ; 23   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
  86  0017 ae0101        	ldw	x,#257
  87  001a cd0000        	call	_CLK_PeripheralClockConfig
  89                     ; 24   TIM2_TimeBaseInit(TIM2_Prescaler_1, TIM2_CounterMode_Up, 61);
  91  001d ae003d        	ldw	x,#61
  92  0020 89            	pushw	x
  93  0021 5f            	clrw	x
  94  0022 cd0000        	call	_TIM2_TimeBaseInit
  96  0025 85            	popw	x
  97                     ; 25   TIM2_OC1Init(TIM2_OCMode_Toggle,
  97                     ; 26                TIM2_OutputState_Enable,
  97                     ; 27                30,
  97                     ; 28                TIM2_OCPolarity_Low,
  97                     ; 29                TIM2_OCIdleState_Reset);
  99  0026 4b00          	push	#0
 100  0028 4b01          	push	#1
 101  002a ae001e        	ldw	x,#30
 102  002d 89            	pushw	x
 103  002e ae3001        	ldw	x,#12289
 104  0031 cd0000        	call	_TIM2_OC1Init
 106  0034 5b04          	addw	sp,#4
 107                     ; 30   TIM2->BKR = 0xA0;
 109  0036 35a05264      	mov	21092,#160
 110                     ; 31   TIM2_Cmd(DISABLE);
 112  003a 4f            	clr	a
 113  003b cd0000        	call	_TIM2_Cmd
 115                     ; 34   GPIO_Init(GPIOA, GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3, GPIO_Mode_Out_PP_Low_Slow);
 117  003e 4bc0          	push	#192
 118  0040 4b0f          	push	#15
 119  0042 ae5000        	ldw	x,#20480
 120  0045 cd0000        	call	_GPIO_Init
 122  0048 85            	popw	x
 123                     ; 35   GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 125  0049 4bc0          	push	#192
 126  004b 4bff          	push	#255
 127  004d ae5005        	ldw	x,#20485
 128  0050 cd0000        	call	_GPIO_Init
 130  0053 85            	popw	x
 131                     ; 36   GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 133  0054 4bc0          	push	#192
 134  0056 4bff          	push	#255
 135  0058 ae500a        	ldw	x,#20490
 136  005b cd0000        	call	_GPIO_Init
 138  005e 85            	popw	x
 139                     ; 37   GPIO_Init(GPIOD, GPIO_Pin_0, GPIO_Mode_Out_PP_Low_Slow);
 141  005f 4bc0          	push	#192
 142  0061 4b01          	push	#1
 143  0063 ae500f        	ldw	x,#20495
 144  0066 cd0000        	call	_GPIO_Init
 146  0069 85            	popw	x
 147                     ; 40   GPIO_Init(LED_PORT, LED_PIN, GPIO_Mode_Out_PP_Low_Slow);
 149  006a 4bc0          	push	#192
 150  006c 4b04          	push	#4
 151  006e ae500a        	ldw	x,#20490
 152  0071 cd0000        	call	_GPIO_Init
 154  0074 85            	popw	x
 155                     ; 43   GPIO_Init(BTN_PORT, BTN1_PIN, GPIO_Mode_In_FL_IT);
 157  0075 4b20          	push	#32
 158  0077 4b02          	push	#2
 159  0079 ae500a        	ldw	x,#20490
 160  007c cd0000        	call	_GPIO_Init
 162  007f 85            	popw	x
 163                     ; 44   GPIO_Init(BTN_PORT, BTN2_PIN, GPIO_Mode_In_FL_IT);
 165  0080 4b20          	push	#32
 166  0082 4b01          	push	#1
 167  0084 ae500a        	ldw	x,#20490
 168  0087 cd0000        	call	_GPIO_Init
 170  008a 85            	popw	x
 171                     ; 48   GPIO_Init(IRLED_PORT, IRLED_PIN, GPIO_Mode_Out_PP_High_Fast);
 173  008b 4bf0          	push	#240
 174  008d 4b01          	push	#1
 175  008f ae5005        	ldw	x,#20485
 176  0092 cd0000        	call	_GPIO_Init
 178  0095 85            	popw	x
 179                     ; 50 }
 182  0096 81            	ret	
 195                     	xdef	_Config
 196                     	xref	_TIM4_TimeBaseInit
 197                     	xref	_TIM2_Cmd
 198                     	xref	_TIM2_OC1Init
 199                     	xref	_TIM2_TimeBaseInit
 200                     	xref	_GPIO_Init
 201                     	xref	_EXTI_SetPinSensitivity
 202                     	xref	_CLK_MasterPrescalerConfig
 203                     	xref	_CLK_PeripheralClockConfig
 222                     	end
