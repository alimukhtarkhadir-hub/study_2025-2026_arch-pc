%include 'in_out.asm'

SECTION .text
    global _start

_start:
    pop ecx     ; Get the number of arguments from the stack
    pop edx     ; Get the program name (first argument) from the stack
    sub ecx, 1  ; Subtract 1 to get the count of actual arguments

next:
    cmp ecx, 0  ; Check if there are arguments left
    jz _end     ; If none, jump to the end
    pop eax     ; Pull the next argument from the stack
    call sprintLF ; Print the argument and a new line
    loop next   ; Decrease ecx and repeat

_end:
    call quit   ; Exit the program
