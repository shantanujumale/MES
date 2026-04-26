ORG 0000H

; Load numbers from memory
MOV A, 50H        ; Load first number
MOV R1, A

MOV A, 51H        ; Load second number
MOV R2, A

COMPARE:
DEC R1            ; Decrement first number
DEC R2            ; Decrement second number

JZ CHECK_R2       ; If R1 becomes zero, check R2
SJMP COMPARE      ; Otherwise continue looping

CHECK_R2:
MOV A, R2
JZ EQUAL          ; If both zero ? equal
SJMP GREATER      ; If R2 not zero ? first finished earlier

LESS:
MOV 60H, #0FFH    ; A < B
SJMP END

GREATER:
MOV 60H, #01H     ; A > B
SJMP END

EQUAL:
MOV 60H, #00H     ; A = B

END:
SJMP END