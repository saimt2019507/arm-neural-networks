     AREA     factorial, CODE, READONLY
     EXPORT __main
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
     ENTRY 
__main  FUNCTION	
 VLDR.F32   s1, = 1
	   VLDR.F32   s2, = 1
       VLDR.F32   s4, = 1
	   VLDR.F32   s5, = 1
	   VLDR.F32   s8, = 1
	   mov r0,#00
	   mov r4,#01  ;choose the gates 
	   

 cmp r4,#01
 beq andgate

 cmp r4,#02
 beq orgate
 
 cmp r4,#03
 beq nand
 
 cmp r4,#04
 beq nor
 
 cmp r4,#05
 beq not
 
 ;cmp r4,#06
 ;beq xor
 
 ;cmp r1,#07
 ;beq xnor


andgate
	   VLDR.F32   s13, = -0.1
	   VLDR.F32   S14, = 0.2
       VLDR.F32   S15, = 0.2
	   VLDR.F32   S22, = -0.2
	   VLDR.F32   S16, = 1
	   VLDR.F32   S17, = 0
	   VLDR.F32   S18, = 1
	  
	   VMUL.F32 S19,s13,S16
	   VMUL.F32 S20,S14,S17
	   VMUL.F32 S21,S15,S18
	   VADD.F32 S19,S20
	   VADD.F32 S19,S21
	   VADD.F32 S19,S22     ;s19 = s13*s16+s14*s17+s15*s18+s22
	   vmov.F32 S9,S19
	   b sigmoid
	   
orgate

       VLDR.F32   s13, = -0.1
	   VLDR.F32   S14, = 0.7
       VLDR.F32   S15, = 0.7
	   VLDR.F32   S22, = -0.1
	   VLDR.F32   S16, = 1
	   VLDR.F32   S17, = 0
	   VLDR.F32   S18, = 1
	  
	   VMUL.F32 S19,s13,S16
	   VMUL.F32 S20,S14,S17
	   VMUL.F32 S21,S15,S18
	   VADD.F32 S19,S20
	   VADD.F32 S19,S21
	   VADD.F32 S19,S22
	   vmov.F32 S9,S19
	   b sigmoid
	   
nand

       VLDR.F32   s13, = 0.6
	   VLDR.F32   S14, = -0.8
       VLDR.F32   S15, = -0.8
	   VLDR.F32   S22, = 0.3
	   VLDR.F32   S16, = 1
	   VLDR.F32   S17, = 0
	   VLDR.F32   S18, = 1
	  
	   VMUL.F32 S19,s13,S16
	   VMUL.F32 S20,S14,S17
	   VMUL.F32 S21,S15,S18
	   VADD.F32 S19,S20
	   VADD.F32 S19,S21
	   VADD.F32 S19,S22
	   vmov.F32 S9,S19
	   b sigmoid

nor

       VLDR.F32   s13, = 0.5
	   VLDR.F32   S14, = -0.7
       VLDR.F32   S15, = -0.7
	   VLDR.F32   S22, = 0.1
	   VLDR.F32   S16, = 1
	   VLDR.F32   S17, = 0
	   VLDR.F32   S18, = 1
	  
	   VMUL.F32 S19,s13,S16
	   VMUL.F32 S20,S14,S17
	   VMUL.F32 S21,S15,S18
	   VADD.F32 S19,S20
	   VADD.F32 S19,S21
	   VADD.F32 S19,S22
	   vmov.F32 S9,S19
	   b sigmoid
	   
not
 VLDR.F32   s13, = 0.5
 VLDR.F32   S14, = -0.7
 VLDR.F32   s22, = 0.1
 VLDR.F32   S16, = 1
 VLDR.F32   S17, = 0
 VMUL.F32 S19,s13,S16
 VMUL.F32 S20,S14,S17
 VADD.F32 S19,S20
 VADD.F32 S19,S22
 vmov.F32 S9,S19
	   b sigmoid

xor

       VLDR.F32   s13, = -5
	   VLDR.F32   S14, = 20
       VLDR.F32   S15, = 10
	   VLDR.F32   S22, = 1
	   VLDR.F32   S16, = 1
	   VLDR.F32   S17, = 0
	   VLDR.F32   S18, = 1
	  
	   VMUL.F32 S19,s13,S16
	   VMUL.F32 S20,S14,S17
	   VMUL.F32 S21,S15,S18
	   VADD.F32 S19,S20
	   VADD.F32 S19,S21
	   VADD.F32 S19,S22
	   vmov.F32 S9,S19
	   b sigmoid


xnor

       VLDR.F32   s13, = -5
	   VLDR.F32   S14, = 20
       VLDR.F32   S15, = 10
	   VLDR.F32   S22, = 1
	   VLDR.F32   S16, = 1
	   VLDR.F32   S17, = 0
	   VLDR.F32   S18, = 1
	  
	   VMUL.F32 S19,s13,S16
	   VMUL.F32 S20,S14,S17
	   VMUL.F32 S21,S15,S18
	   VADD.F32 S19,S20
	   VADD.F32 S19,S21
	   VADD.F32 S19,S22
	   vmov.F32 S9,S19
	   b sigmoid
	   
	   
sigmoid	   VSUB.F32 S1,S9      
loop 
;subtraction of terms
 VADD.F32 S5,S4         ;incrementing the value that ia used as denominator
 VMUL.F32 S8,S5         ;factorial calculation
 VMOV.F32 S6,S9
 ;VLDR.F32   s6, = 0.5   ;X VALUE
 ;VLDR.F32   s6, = 0.7
 VDIV.F32 S6,S8         ; x/(incremented value) 
 VMOV.F32 S7,S9
 ;VLDR.F32   s7, = 0.5   ;X VALUE
 ;VLDR.F32   s7, = 0.7
 VMUL.F32 S2,S7         ; (s2*x) 
 VFMA.F32 S1,S2,S6      ;s1=s1+(((s2*x))*(x/incremented value))

;addition of terms
 
 VMUL.F32 S2,S7          ; (s2*x)
 VADD.F32 S5,S4          ;S5 gives the number of terms in series
 VMUL.F32 S8,S5          ;factorial calculation
 VMOV.F32 S6,S9
 ;VLDR.F32   s6, = 0.5    ; x value
 ;VLDR.F32   s6, = 0.7
 VDIV.F32 S6,S8
 VFMS.F32 S1,S2,S6       ;s1=s1+(((-s2*x))*(x/s6))   working of algorithm
 
 
 VLDR.F32   s10, = 1
 VLDR.F32   s11, = 1
 VADD.F32 S10,S1
 VDIV.F32 S11,S10
 VMOV.F32 S12,S11
 add r0,#01
 cmp r0,#07

  VCVT.U32.F32 s12,s12
  vmov r3,d6[1]
 
  bne loop
   VLDR.F32   s25, = 0.5   ;offset for deciding the logic
   VCMP.F32 S12,S25        ; comparing the sigmoid value with the offset
   BGE greater
   BLT lesser
   
greater
 mov r0,#0x01     ;logic 1
 BL printMsg
B endfunc
 
lesser
 mov r0,#0x00     ;logic 0
 BL printMsg

	   
     
     ENDFUNC
     END 
