%include"io.inc"
section .data
    A dd -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
section .text
global main
main:
    mov ecx, 10
cycle:
    GET_CHAR eax
    cmp eax, '.'
    je cycle2
    sub eax, '0'
    cmp eax, 0
    jl cycle
    cmp eax, 9
    jg cycle
    mov dword[A+eax * 4], eax
    jmp cycle
cycle2:
    cmp ecx, 0
    je end
    dec ecx
    mov edx, dword[A + ecx * 4]
    cmp edx, -1
    je cycle2
    PRINT_DEC 4, edx
    jmp cycle2
end:
    ;write your code here
    xor eax, eax
    ret