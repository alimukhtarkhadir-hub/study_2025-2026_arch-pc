%include 'in_out.asm'

SECTION .data
    msg_f db "Функция: f(x) = 15x - 9",0
    msg_r db "Результат: ",0

SECTION .text
    global _start

_start:
    pop ecx          ; Количество аргументов
    pop edx          ; Имя программы
    sub ecx, 1       ; Количество чисел
    mov esi, 0       ; Здесь храним итоговую сумму

next:
    cmp ecx, 0
    jz _end
    pop eax          ; Достаем x (строку)
    call atoi        ; Превращаем в число (eax = x)
    
    ; Вычисляем 15 * x - 9
    mov ebx, 15
    imul eax, ebx    ; eax = x * 15
    sub eax, 9       ; eax = 15x - 9
    
    add esi, eax     ; Добавляем результат к общей сумме
    loop next

_end:
    mov eax, msg_f
    call sprintLF
    mov eax, msg_r
    call sprint
    mov eax, esi     ; Выводим итоговую сумму
    call iprintLF
    call quit
