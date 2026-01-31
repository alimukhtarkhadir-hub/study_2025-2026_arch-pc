%include 'in_out.asm'

SECTION .data
    filename db 'readme.txt', 0h
    msg      db 'Enter string to write: ', 0h

SECTION .bss
    contents resb 255

SECTION .text
    global _start

_start:
    ; --- Print prompt
    mov eax, msg
    call sprint

    ; ---- Read input
    mov ecx, contents
    mov edx, 255
    call sread

    ; --- Create the file (sys_creat = 8)
    ; Mode 0644o = rw-r--r--
    mov ecx, 0644o
    mov ebx, filename
    mov eax, 8
    int 80h

    ; --- Save descriptor
    mov esi, eax

    ; --- Calculate length
    mov eax, contents
    call slen

    ; --- Write to file
    mov edx, eax
    mov ecx, contents
    mov ebx, esi
    mov eax, 4
    int 80h

    ; --- Close file
    mov ebx, esi
    mov eax, 6
    int 80h

    call quit
