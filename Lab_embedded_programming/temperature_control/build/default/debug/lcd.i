# 1 "lcd.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/opt/microchip/mplabx/v6.10/packs/Microchip/PIC18Fxxxx_DFP/1.4.151/xc8/pic/include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "lcd.c" 2
# 23 "lcd.c"
# 1 "./lcd.h" 1
# 23 "./lcd.h"
 void lcdCommand(unsigned char cmd);
 void lcdData(unsigned char valor);
 void lcdInit(void);
# 23 "lcd.c" 2

# 1 "./pic18f4520.h" 1
# 24 "lcd.c" 2
# 36 "lcd.c"
void Delay40us(void) {
    unsigned char i;
    for (i = 0; i < 25; i++);
}

void Delay2ms(void) {
    unsigned char i;
    for (i = 0; i < 50; i++) {
        Delay40us();
    }
}

void lcdCommand(unsigned char cmd) {
    (((*(volatile __near unsigned char*)0xF84)) &= ~(1<<0));
    (((*(volatile __near unsigned char*)0xF84)) &= ~(1<<2));
    (*(volatile __near unsigned char*)0xF83) = cmd;

    (((*(volatile __near unsigned char*)0xF84)) |= (1<<1));
    (((*(volatile __near unsigned char*)0xF84)) &= ~(1<<1));
    if ((cmd == 0x02) || (cmd == 0x01)) {
        Delay2ms();
    } else {
        Delay40us();
    }
}

void lcdData(unsigned char valor) {
    (((*(volatile __near unsigned char*)0xF84)) |= (1<<0));
    (((*(volatile __near unsigned char*)0xF84)) &= ~(1<<2));


    (*(volatile __near unsigned char*)0xF83) = valor;

    (((*(volatile __near unsigned char*)0xF84)) |= (1<<1));
    (((*(volatile __near unsigned char*)0xF84)) &= ~(1<<1));

    (((*(volatile __near unsigned char*)0xF84)) &= ~(1<<0));
    Delay40us();
}

void lcdInit(void) {

    (((*(volatile __near unsigned char*)0xF96)) &= ~(1<<0));
    (((*(volatile __near unsigned char*)0xF96)) &= ~(1<<1));
    (((*(volatile __near unsigned char*)0xF96)) &= ~(1<<2));
    (*(volatile __near unsigned char*)0xF95) = 0x00;
    (*(volatile __near unsigned char*)0xFC1) = 0b00001110;


    Delay2ms();
    Delay2ms();
    Delay2ms();
    Delay2ms();
    Delay2ms();

    lcdCommand(0x38);
    Delay2ms();
    Delay2ms();
    lcdCommand(0x38);
    Delay2ms();
    lcdCommand(0x38);

    lcdCommand(0x38);
    lcdCommand(0x06);
    lcdCommand(0x0F);
    lcdCommand(0x01);
}
