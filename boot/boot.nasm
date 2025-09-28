%DEFINE INIT 0x7C00
%DEFINE VIDEO_FUNC 0x10 
%DEFINE SIZE 512
%DEFINE BOOT_SIGN 00AA55h
%DEFINE ZERO 0

ORG INIT

BITS 16
msg db "Hello, World!", ZERO
MSG_LEN equ  $ - msg




;*******************************************************************;
;              Garante que todos os registradores sejam 0           ;
;*******************************************************************;
.clear_registers:
    xor ax, ax 
    mov cx, ax
    mov si, ax
    mov ah, ax

;*******************************************************************;
;            Define o contador e o ponteiro da mensagem           ;
;*******************************************************************;

start:
    cli
    call .clear_registers
    cld
    mov cx, MSG_LEN
    mov si, msg

;*******************************************************************;
;                  Itera sobre o ponteiro e chama a BIOS                ;
;*******************************************************************;

.next_char:
    lodsb
    mov ah, 0xE
    int VIDEO_FUNC
    loop .next_char


;*******************************************************************;
;                Pausa a CPU até a próxima interrupção                ;
;*******************************************************************;

.halt:
    sti
    hlt
    jmp .halt   


;*******************************************************************;
;                      Substitui os bytes não usados por 0                 ;
;*******************************************************************;

times (SIZE-2)-($-$$) db ZERO
dw BOOT_SIGN