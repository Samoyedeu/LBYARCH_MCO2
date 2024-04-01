section .text
bits 64
default rel

global stencil_asm

stencil_asm:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; non-volatile
    ; Arguments:
    ; [rcx] : int n
    ; [r8] : int* X
    ; [rdx]  : int* Y

    mov rsi, [r8] ; X
    mov rdi, [rdx]  ; Y
    mov r8d, [rcx] ; n

    ; Loop counter (i)
    mov r9, 3

inner_loop:
    ; Compare i with (n - 3)
    cmp r9, r8
    jae loop_end      ; If i >= (n - 3), exit loop

    ; Calculate Y[i]
    mov r10, r9       ; r10 = i
    sub r10, 3        ; r10 = i - 3 (index for X)

    ; Load X[i - 3] to X[i + 3] into xmm0 - xmm6
    movsd xmm0, [rsi + r10 * 8]     ; Load X[i - 3] into xmm0
    movsd xmm1, [rsi + r10 * 8 + 8] ; Load X[i - 2] into xmm1
    movsd xmm2, [rsi + r10 * 8 + 16]; Load X[i - 1] into xmm2
    movsd xmm3, [rsi + r10 * 8 + 24]; Load X[i] into xmm3
    movsd xmm4, [rsi + r10 * 8 + 32]; Load X[i + 1] into xmm4
    movsd xmm5, [rsi + r10 * 8 + 40]; Load X[i + 2] into xmm5
    movsd xmm6, [rsi + r10 * 8 + 48]; Load X[i + 3] into xmm6

    ; Add X[i - 3] + X[i - 2] + X[i - 1] + X[i] + X[i + 1] + X[i + 2] + X[i + 3]
    addsd xmm0, xmm1
    addsd xmm0, xmm2
    addsd xmm0, xmm3
    addsd xmm0, xmm4
    addsd xmm0, xmm5
    addsd xmm0, xmm6

    ; Store the result in Y[i]
    movsd [rdi + r10 * 8], xmm0

    ; Increment loop counter (i)
    inc r9
    jmp inner_loop

loop_end:
    ; Function epilogue
    pop rbp
    ret
