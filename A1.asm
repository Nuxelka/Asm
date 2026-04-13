%include"io.inc"

section .bss

section .data
    max dd 0
section .text
global main
main:
    mov edx, 0; счетчик на ноль
    mov ebx, 1; флаг на 1
    GET_DEC 4, ecx; счетчик цикла
    cmp ecx, 0
    je end; проверка, если ноль чисел
cycle:
    cmp ecx, 0
    je end
    GET_DEC 4, eax
    dec ecx
    cmp eax, 0
    jle niger; если неположительное
    cmp ebx, 1
    je plus
    mov ebx, 1
    inc edx
    jmp cycle
plus:
    inc edx
    cmp edx, dword[max]
    jl cycle
    mov dword[max], edx
    jmp cycle
niger:
    mov ebx, 0
    cmp edx, dword[max]
    jl exit
    mov dword[max], edx
exit:
    mov edx, 0
    jmp cycle
end:
    mov eax, dword[max]
    PRINT_DEC 4, eax
    xor eax, eax
    ret

