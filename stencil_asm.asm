section .data
var dq 1.5
var2 dq 5.1
zero dq 0.0

section .text
bits 64
default rel
global stencil_asm

stencil_asm:
	MOV R9, 0 ; i
	MOV R10, 0 ; i - n
	MOV R11, 0 ; counter
	MOVSD XMM1, [zero]
	JMP check
skip:
	INC R9
check:
	CMP R9, 3
	JL skip

	MOV RBX, RCX
	SUB RBX, 4

	CMP R9, RBX
	JG end
process:
	MOVSD XMM1, [zero]
	MOVSD XMM2, [zero]

	MOV R10, R9
	SUB R10, 3
	MOVSD XMM2, [RDX + R10*8]
	ADDSD XMM1, XMM2

	MOV R10, R9
	SUB R10, 2
	MOVSD XMM2, [RDX + R10*8]
	ADDSD XMM1, XMM2

	MOV R10, R9
	SUB R10, 1
	MOVSD XMM2, [RDX + R10*8]
	ADDSD XMM1, XMM2

	MOV R10, R9
	MOVSD XMM2, [RDX + R10*8]
	ADDSD XMM1, XMM2

	MOV R10, R9
	ADD R10, 1
	MOVSD XMM2, [RDX + R10*8]
	ADDSD XMM1, XMM2

	MOV R10, R9
	ADD R10, 2
	MOVSD XMM2, [RDX + R10*8]
	ADDSD XMM1, XMM2

	MOV R10, R9
	ADD R10, 3
	MOVSD XMM2, [RDX + R10*8]
	ADDSD XMM1, XMM2

	; change vector_y
	MOVSD [R8 + R9*8], XMM1

	INC R9
	INC R11
	JMP check
end:
	ret