global _start

section .date
msg: db "input:",0x6, 0
star: db "*", 0x1, 0

_start:
	PUSH RBP
	MOV RBP,RSP

	SUB RSP,0xC
	MOV RBX,RBP
	SUB RBX,0x4

	MOV RAX,0x1
	MOV RDI,0x1
	MOV RSI,msg
	MOV RDX,0x6

	call _syscall

	MOV RAX,0x0
	MOV RDI,0x0
	MOV RSI,RBX
	MOV RDX,0x1

	call _syscall

	XOR RAX,RAX
	MOV QWORD PTR [RBP-0x4],RAX
	MOV RBX, [RBP-0x4]
	CMP [RBP-0x8],RBX
	JL SECONDF
SECONDF:
	
	MOV [EBP-0xC],0
	MOV RBX, [RBP-0x8]
	CMP [RBP-0xC],RBX	
	JLE STAR
STAR:
	MOV RAX,0X1
	MOV RDI,0X1
	MOV RSI,star
	MOV RDX,0X1

	call _syscall

	JMP SECONDF

	MOV RAX,0X1
	MOV RDI,0X1
	MOV RSI,RBX
	MOV RDX,0X1

	call _syscall

	MOV RAX, 60 ;EXIT()
	
	call _syscall
	
_syscall:
	syscall
	ret
