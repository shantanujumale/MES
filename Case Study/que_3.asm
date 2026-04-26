ORG 0000H
; -------- Initialization --------
MOV 30H, #40H      ; 30H holds address 40H
MOV 40H, #55H      ; Actual data stored at 40H

; -------- Direct Addressing --------
MOV A, 30H         ; A ? contents of 30H (40H)
MOV 60H, A         ; Store direct output at 60H

; -------- Indirect Addressing --------
MOV R0, #30H       ; R0 points to 30H
MOV A, @R0         ; A ? contents of 30H (40H)
MOV R0, A          ; R0 now points to 40H
MOV A, @R0         ; A ? contents of 40H (55H)
MOV 61H, A         ; Store indirect output at 61H

HERE:
SJMP HERE          ; Infinite loop

END
