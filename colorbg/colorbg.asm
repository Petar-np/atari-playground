    processor 6502

    include "vcs.h"
    include "macro.h"

    seg code
    org $F000           ; defines the origin of the ROM at $F000

START:
    CLEAN_START         ; macro to safely clear the memory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set background luminosity color to yellow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda #$1E            ; load color into A ($1E is NTSC yellow)
    sta COLUBK          ; store A to Backgorund Color Address $09
 
    jmp START           ; repeat from Start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fill ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org $FFFC           ; Defines origin to $FFFC
    .word START         ; Reset vector at $FFFC (where program starts)
    .word START         ; Interrupt vector at $FFFE (unused in VCS)

