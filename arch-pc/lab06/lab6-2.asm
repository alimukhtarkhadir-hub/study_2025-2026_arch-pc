%include 'in_out.asm'

SECTION .text
    GLOBAL _start
_start:
    ; Addition of characters '6' and '4'
    mov eax, '6'
    mov ebx, '4'
    add eax, ebx

    ; iprintLF takes the value directly from EAX and prints it as an integer
    call iprintLF

    call quit
