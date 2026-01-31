%include 'in_out.asm'

SECTION .data
    prompt   db "What is your name? ", 0
    prefix   db "My name is ", 0
    filename db "name.txt", 0

SECTION .bss
    name_buffer resb 255

SECTION .text
    global _start

_start:
    ; Print prompt to screen
    mov eax, prompt
    call sprint

    ; Read name from keyboard
    mov ecx, name_buffer
    mov edx, 255
    call sread

    ; Create file (sys_creat = 8)
    ; 0664o sets permissions to rw-rw-r--
    mov ecx, 0664o
    mov ebx, filename
    mov eax, 8
    int 80h

    ; Save file descriptor
    mov esi, eax

    ; Write "My name is " to file
    mov edx, 11       ; length of "My name is "
    mov ecx, prefix
    mov ebx, esi
    mov eax, 4
    int 80h

    ; Calculate length of entered name and write it
    mov eax, name_buffer
    call slen
    mov edx, eax      ; length of user input
    mov ecx, name_buffer
    mov ebx, esi
    mov eax, 4
    int 80h

    ; Close file (sys_close = 6)
    mov ebx, esi
    mov eax, 6
    int 80h

    call quit
