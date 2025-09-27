ORG 0x7C00
BITS 16

msg db "Hello, World!", 0
MSG_LEN equ  $ - msg

start:
    cld
    mov cx, MSG_LEN
    mov si, msg

.next_char:
    lodsb
    mov ah, 0xE
    int 0x10
    loop .next_char

.halt:
    jmp .halt
    hlt

times 510-($-$$) db 0
dw 0AA55h