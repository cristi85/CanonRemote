   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  21                     	bsct
  22  0000               L3_FLAG_Battery_Low:
  23  0000 00            	dc.b	0
  65                     ; 48 void main(void)
  65                     ; 49 {
  67                     .text:	section	.text,new
  68  0000               _main:
  72                     ; 50   disableInterrupts();
  75  0000 9b            	sim	
  77                     ; 51   Config();
  80  0001 cd0000        	call	_Config
  82                     ; 52   enableInterrupts();
  85  0004 9a            	rim	
  87                     ; 55   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);  
  91                     ; 56   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
  94                     ; 57   LED_OFF;
  96                     ; 59   halt();
 100  0005               L32:
 102  0005 ae0100        	ldw	x,#256
 103  0008 cd0000        	call	_CLK_PeripheralClockConfig
 105  000b ae0400        	ldw	x,#1024
 106  000e cd0000        	call	_CLK_PeripheralClockConfig
 108  0011 7215500a      	bres	20490,#2
 109  0015 8e            	halt	
 110                     ; 63     CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv4);    // Set System Clock to 4Mhz
 112  0016 a602          	ld	a,#2
 113  0018 cd0000        	call	_CLK_MasterPrescalerConfig
 115                     ; 65     CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 117  001b ae0401        	ldw	x,#1025
 118  001e cd0000        	call	_CLK_PeripheralClockConfig
 120                     ; 66     TIM4_TimeBaseInit(TIM4_Prescaler_16, 0xFF);  // 4us delay timebase
 122  0021 ae04ff        	ldw	x,#1279
 123  0024 cd0000        	call	_TIM4_TimeBaseInit
 125                     ; 67     CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
 127  0027 ae0101        	ldw	x,#257
 128  002a cd0000        	call	_CLK_PeripheralClockConfig
 130                     ; 68     TIM2_Cmd(ENABLE);
 132  002d a601          	ld	a,#1
 133  002f cd0000        	call	_TIM2_Cmd
 135                     ; 69     disableInterrupts();
 138  0032 9b            	sim	
 140                     ; 71     TIM2->CCER1 |= TIM_CCER1_CC1E;  // enable PWM output
 143  0033 ad42          	call	LC002
 144                     ; 74     if(Btn_pressed == 0)
 146  0035 b600          	ld	a,_Btn_pressed
 147  0037 260d          	jrne	L72
 148                     ; 76       delay_tim4(250);
 150  0039 a6fa          	ld	a,#250
 151  003b ad2f          	call	LC001
 152  003d ad2d          	call	LC001
 153  003f cd0000        	call	_delay_tim4
 155                     ; 81       delay_tim4(100);
 157  0042 a664          	ld	a,#100
 160  0044 200d          	jra	L13
 161  0046               L72:
 162                     ; 85       delay_tim4(250);
 164  0046 a6fa          	ld	a,#250
 165  0048 ad22          	call	LC001
 166  004a ad20          	call	LC001
 167  004c ad1e          	call	LC001
 168  004e cd0000        	call	_delay_tim4
 170                     ; 92       delay_tim4(101);
 172  0051 a665          	ld	a,#101
 174  0053               L13:
 175  0053 cd0000        	call	_delay_tim4
 176                     ; 94     TIM2->CCER1 |= TIM_CCER1_CC1E;  // enable PWM output
 178  0056 ad1f          	call	LC002
 179                     ; 97     TIM2_Cmd(DISABLE);
 181  0058 4f            	clr	a
 182  0059 cd0000        	call	_TIM2_Cmd
 184                     ; 99     enableInterrupts();
 187  005c 9a            	rim	
 189                     ; 101     LED_ON;
 192  005d 7214500a      	bset	20490,#2
 193                     ; 102     delay_tim4(80);
 195  0061 a650          	ld	a,#80
 196  0063 cd0000        	call	_delay_tim4
 198                     ; 103     LED_OFF;
 200  0066 7215500a      	bres	20490,#2
 201                     ; 106     CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);  
 203                     ; 107     CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
 205                     ; 108     LED_OFF;
 206                     ; 110     halt();
 212  006a 2099          	jra	L32
 213  006c               LC001:
 214  006c cd0000        	call	_delay_tim4
 216                     ; 77       delay_tim4(250);
 218  006f a6fa          	ld	a,#250
 219  0071 cd0000        	call	_delay_tim4
 221                     ; 78       delay_tim4(250);
 223  0074 a6fa          	ld	a,#250
 224  0076 81            	ret	
 225  0077               LC002:
 226  0077 7210525a      	bset	21082,#0
 227                     ; 72     delay_tim4(119);
 229  007b a677          	ld	a,#119
 230  007d cd0000        	call	_delay_tim4
 232                     ; 73     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);  // disable PWM output
 234  0080 7211525a      	bres	21082,#0
 235  0084 81            	ret	
 280                     	xdef	_main
 281                     	xref.b	_Btn_pressed
 282                     	xref	_delay_tim4
 283                     	xref	_Config
 284                     	xref	_TIM4_TimeBaseInit
 285                     	xref	_TIM2_Cmd
 286                     	xref	_CLK_MasterPrescalerConfig
 287                     	xref	_CLK_PeripheralClockConfig
 306                     	end
