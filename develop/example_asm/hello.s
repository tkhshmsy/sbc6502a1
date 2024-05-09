.include        "sbc6502a1.inc"

    .segment    "STARTUP"   ; no use but aviod ld65's warning
    .segment    "CODE"      ; start at $0300
    .org        $0300
main:
    cld                     ; clear BCD Math mode
    ldy         #0          ; set Y to 0
loop:
    lda         message,y   ; A = message[Y]
    beq         done        ; if A == $00 then goto done
    jsr         ECHO        ; ECHO A, subroutine in wozmon
    iny                     ; Y++
    jmp         loop        ; goto loop
done:
    jmp         RESET       ; exit to RESET

    .segment    "RODATA"
message:
    .byte       $0D, $0A, "Hello, world!", $0D, $0A, $00

    .segment    "ONCE"      ; no use but aviod ld65's warning
    .segment    "DATA"      ; no use
