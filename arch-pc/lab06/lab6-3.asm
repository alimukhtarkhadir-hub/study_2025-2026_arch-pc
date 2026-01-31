%include 'in_out.asm'

SECTION .data
div: DB 'Результат: ',0
rem: DB 'Остаток от деления: ',0

SECTION .text
GLOBAL _start
_start:

; ---- Вычисление выражения (5*2+3)/3
mov eax,5       ; EAX=5
mov ebx,2       ; EBX=2
mul ebx         ; EAX=EAX*EBX (EAX=10)
add eax,3       ; EAX=EAX+3 (EAX=13)
xor edx,edx     ; обнуляем EDX для корректной работы div
mov ebx,3       ; EBX=3
div ebx         ; EAX=EAX/3 (EAX=4), EDX=остаток (EDX=1)
mov edi,eax     ; запись результата вычисления в 'edi'

; ---- Вывод результата на экран
mov eax,div
call sprint
mov eax,edi
call iprintLF

mov eax,rem
call sprint
mov eax,edx
call iprintLF

call quit
