%include 'in_out.asm'

section .data
    msg_x db "Введите x: ",0
    msg_a db "Введите a: ",0
    msg_res db "Результат: ",0

section .bss
    x resb 10
    a resb 10

section .text
    global _start

_start:
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    mov eax, x
    call atoi
    mov [x], eax

    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    mov eax, a
    call atoi
    mov [a], eax

    mov eax, [x]
    cmp eax, 5
    jl label_ax
    sub eax, 5
    jmp print_res

label_ax:
    mov ebx, [a]
    mul ebx

print_res:
    mov edi, eax
    mov eax, msg_res
    call sprint
    mov eax, edi
    call iprintLF
    call quit
