%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x: ',0
rem: DB 'Результат: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:
    ; --- Input ---
    mov eax, msg
    call sprint
    
    mov ecx, x
    mov edx, 80
    call sread
    
    mov eax, x
    call atoi      ; Converts the input string in EAX to an integer
    
    ; --- Arithmetic: (8*x - 6) / 2 ---
    mov ebx, 8
    mul ebx        ; EAX = EAX * 8
    
    sub eax, 6     ; EAX = EAX - 6
    
    mov ebx, 2
    xor edx, edx   ; Essential: Clear EDX before dividing EAX
    div ebx        ; EAX = EAX / 2
    
    ; --- Output ---
    mov edi, eax   ; Save the result in EDI
    
    mov eax, rem
    call sprint
    
    mov eax, edi   ; Move result back to EAX for printing
    call iprintLF
    
    call quit
