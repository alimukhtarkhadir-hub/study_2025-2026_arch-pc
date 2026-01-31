%include 'in_out.asm'

section .data
    a dd 99
    b dd 29
    c dd 26
    msg db "Наименьшее число: ",0

section .bss
    min resb 10

section .text
    global _start

_start:
    mov ecx, [a]
    mov [min], ecx

    cmp ecx, [b]
    jl check_c
    mov ecx, [b]
    mov [min], ecx

check_c:
    mov ecx, [min]
    cmp ecx, [c]
    jl fin
    mov ecx, [c]
    mov [min], ecx

fin:
    mov eax, msg
    call sprint
    mov eax, [min]
    call iprintLF
    call quit
