ORG 0000H

; -------- Initialization --------
MOV R0, #40H        ; R0 = source pointer (scan)
MOV R1, #40H        ; R1 = destination pointer (compact)

; -------- Scan Loop --------
SCAN:
MOV A, @R0          ; Read current data
CJNE A, #0FFH, COPY ; If not FFH, copy
SJMP SKIP           ; If FFH, ignore

; -------- Copy Valid Data --------
COPY:
MOV @R1, A          ; Copy valid data
INC R1              ; Move destination pointer

; -------- Move Source Pointer --------
SKIP:
INC R0              ; Move source pointer
CJNE R0, #60H, SCAN ; Scan until 5FH

; -------- Fill Remaining with 00H --------
FILL:
MOV A, R1
CJNE A, #60H, FILL_ZERO
SJMP END

FILL_ZERO:
MOV @R1, #00H       ; Fill unused memory
INC R1
SJMP FILL

END:
SJMP END
