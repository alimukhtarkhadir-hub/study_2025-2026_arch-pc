%include 'in_out.asm'

SECTION .data
msg: DB 'Введите № студенческого билета: ',0
rem: DB 'Ваш вариант: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:
    mov eax, msg
    call sprintLF
    
    mov ecx, x
    mov edx, 80
    call sread
    
    mov eax, x
    call atoi      ; converts string to integer in eax
    
    xor edx, edx   ; clear edx for division
    mov ebx, 20
    div ebx        ; eax / 20, remainder goes to edx
    
    inc edx        ; variant = remainder + 1
    
    mov eax, rem
    call sprint
    
    mov eax, edx
    call iprintLF
    
    call quit
