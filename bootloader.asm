ORG 0x00
BITS 16

__start:
	jmp short start
	nop

times 33 db 0

start:
	jmp 0x7c0:step2

step2:
	cli
	mov ax, 0x7c0
	mov ds, ax
	mov ax, 0x00
	mov ss, ax
	mov sp, 0x7c00
	sti

	mov si, message
	call print
	jmp $

print:
	mov bx, 0
.loop:
	lodsb
	cmp al,0
	je .end
	call printchar
	jmp .loop

.end:
	ret

printchar:
	mov ah,0eh
	int 0x10
	ret

message: db 'This is your new bootloader!', 0

times 510- ($ - $$) db 0
dw 0xAA55
