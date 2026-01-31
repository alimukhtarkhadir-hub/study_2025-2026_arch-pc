%include 'in_out.asm'

SECTION .bss
    buf1: RESB 80

SECTION .text
    GLOBAL _start
_start:
    ; Addition of characters '6' and '4'
    mov eax, 6
    mov ebx, 4
    add eax, ebx

    ; To print as a character, we must move the value to memory
    mov [buf1], eax
    mov eax, buf1
    call sprintLF

    call quit
