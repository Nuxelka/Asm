%include"io.inc"
section .data
    max dd 0
section .text
global main
main:
    GET_DEC 4, ecx
    xor ebx, ebx
cycle:
    cmp ecx, 0
    je end
    GET_DEC 4, eax
    dec ecx
    cmp eax, 0
    jne nzero
    inc ebx
    cmp ebx, dword[max]
    jle yuu
    mov dword[max], ebx
yuu:
    jmp cycle
nzero:
    cmp ebx, dword[max]
    jle xui
    mov dword[max], ebx
xui:
    xor ebx, ebx
    jmp cycle
end:
    mov eax, dword[max]
    PRINT_DEC 4, eax
    xor eax, eax
    ret