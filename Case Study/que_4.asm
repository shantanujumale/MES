ORG 0000H

; -------- Build LOW byte (B0H) --------
CLR A              ; A = 00H
ORL A, #80H        ; Set bit 7 → A = 80H
ORL A, #20H        ; Set bit 5 → A = A0H
ORL A, #10H        ; Set bit 4 → A = B0H
MOV R0, A          ; Save LOW byte in R0

; -------- Build HIGH byte (1AH) --------
CLR A              ; A = 00H
ORL A, #10H        ; Set bit 4 → A = 10H
ORL A, #08H        ; Set bit 3 → A = 18H
ORL A, #02H        ; Set bit 1 → A = 1AH
MOV B, A           ; Store HIGH byte in B

; -------- Final Result --------
MOV A, R0          ; A = LOW byte (B0H)
                   ; B:A = 1AB0H

HERE:
SJMP HERE

END
