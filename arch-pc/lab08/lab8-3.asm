%include 'in_out.asm'

SECTION .data
    msg db "Результат произведения: ",0

SECTION .text
    global _start

_start:
    pop ecx     ; Получаем количество аргументов
    pop edx     ; Пропускаем имя программы
    sub ecx, 1  ; Уменьшаем счетчик на 1 (убираем само имя программы)
    
    mov esi, 1  ; Начальное значение для произведения

next:
    cmp ecx, 0  ; Если аргументов нет, выходим
    jz _end
    pop eax     ; Достаем следующий аргумент
    call atoi   ; Превращаем строку в число
    imul esi, eax ; Умножаем результат на число
    loop next

_end:
    mov eax, msg
    call sprint
    mov eax, esi
    call iprintLF
    call quit
