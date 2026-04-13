%include"io.inc"
section .bss
    A resd 26
section .text
global main
main:
    mov ebp, esp; for correct debugging
    xor ebx, ebx; max
    xor ecx, ecx
    xor edx, edx
cycle:
    GET_CHAR eax
    cmp eax, '.'
    je cycle2
    cmp eax, 'a'
    jb cycle
    cmp eax, 'z'
    ja cycle
    sub eax, 'a'
    inc dword[A + eax * 4]
    jmp cycle
   
cycle2:
    cmp ecx, 26
    je cycle3
    cmp dword[A + ecx * 4], ebx
    jb niger
    mov ebx, dword[A + ecx * 4]
niger:   
    inc ecx
    jmp cycle2
     
cycle3:
    cmp edx, 26
    je end
    cmp dword[A + edx * 4], ebx
    je end
    inc edx
    jmp cycle3

end:
    add edx, 'a'
    PRINT_CHAR edx
    ;write your code here
    xor eax, eax
    ret