
%include"io.inc"

section .text
check: 
    push ebp
    mov ebp, esp
    mov eax, dword[ebp + 8]
    mov edx, eax
    and eax, 11111b
    shr edx, 27
    cmp edx, eax
    je .result
    mov eax, 0
    jmp .end
.result:
    mov eax, 1
.end:
    pop ebp
    ret
global main
main:
   xor ecx, ecx
cycle:
    GET_DEC 4, ebx
    cmp ebx, 0
    je end 
    push ebx
    call check
    add esp, 4
    add ecx, eax
    jmp cycle
end:
    PRINT_DEC 4, ecx
    ;write your code here
    xor eax, eax
    ret