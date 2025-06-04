# 1 "keypad.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/opt/microchip/mplabx/v6.10/packs/Microchip/PIC18Fxxxx_DFP/1.4.151/xc8/pic/include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "keypad.c" 2
# 23 "keypad.c"
# 1 "./keypad.h" 1
# 23 "./keypad.h"
 unsigned char kpRead(void);
 void kpDebounce(void);
 void kpInit(void);
# 23 "keypad.c" 2

# 1 "./pic18f4520.h" 1
# 24 "keypad.c" 2


static unsigned char valor = 0x00;

unsigned char kpRead(void) {
    return valor;
}

void kpDebounce(void) {
# 41 "keypad.c"
    unsigned char i, j;
    static unsigned char tempo;
    static unsigned char valorNovo = 0x0000;
    static unsigned char valorAntigo = 0x0000;

    for (i = 0; i < 4; i++) {
        (*(volatile __near unsigned char*)0xF93) = ~((unsigned char) 1 << i);
        (*(volatile __near unsigned char*)0xF81) = ~((unsigned char) 1 << i);


        for (j = 0; j < 2; j++) {
            if (!(((*(volatile __near unsigned char*)0xF81)) & (1<<j + 4))) {
                ((valorNovo) |= (1<<(i * 2) + j));
            } else {
                ((valorNovo) &= ~(1<<(i * 2) + j));
            }
        }
    }
    if (valorAntigo == valorNovo) {
        tempo--;
    } else {
        tempo = 10;
        valorAntigo = valorNovo;
    }
    if (tempo == 0) {
        valor = valorAntigo;
    }

}

void kpInit(void) {
    (*(volatile __near unsigned char*)0xF93) = 0xFF;
    (((*(volatile __near unsigned char*)0xFF1)) &= ~(1<<7));
    (*(volatile __near unsigned char*)0xFC1) = 0b00001110;




}
