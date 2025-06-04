# 1 "main.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/opt/microchip/mplabx/v6.10/packs/Microchip/PIC18Fxxxx_DFP/1.4.151/xc8/pic/include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "main.c" 2







# 1 "./config.h" 1
# 38 "./config.h"
#pragma config MCLRE=ON
#pragma config OSC=HS
#pragma config WDT=OFF
#pragma config LVP=OFF
#pragma config DEBUG = OFF
#pragma config WDTPS = 1
# 9 "main.c" 2
# 1 "./adc.h" 1
# 22 "./adc.h"
 void adcInit(void);
 int adcRead(void);
# 10 "main.c" 2
# 1 "./lcd.h" 1
# 23 "./lcd.h"
 void lcdCommand(unsigned char cmd);
 void lcdData(unsigned char valor);
 void lcdInit(void);
# 11 "main.c" 2
# 1 "./pic18f4520.h" 1
# 12 "main.c" 2
# 1 "./pwm.h" 1
# 23 "./pwm.h"
 void pwmSet1(unsigned char porcento);
 void pwmSet2(unsigned char porcento);
 void pwmFrequency(unsigned int freq);
 void pwmInit(void);
# 13 "main.c" 2
# 1 "./keypad.h" 1
# 23 "./keypad.h"
 unsigned char kpRead(void);
 void kpDebounce(void);
 void kpInit(void);
# 14 "main.c" 2
# 1 "./contTemp.h" 1
# 11 "./contTemp.h"
unsigned char limiteSup;
unsigned char limiteInf;

unsigned int cooler;
unsigned int resis;

void ConfiguraLimiteSuperior(unsigned char temp);
void ConfiguraLimiteInferior(unsigned char temp);
void AtualizarSistema(void);
# 15 "main.c" 2





void printInt(unsigned int temp) {
    lcdCommand(0x80);
    lcdData('T');
    lcdData(((temp / 1000) % 10) + 48);
    lcdData(((temp / 100) % 10) + 48);
    lcdData(((temp / 10) % 10) + 48);
    lcdData((temp % 10) + 48);
    lcdData('H');
    lcdData(((limiteSup / 1000) % 10) + 48);
    lcdData(((limiteSup / 100) % 10) + 48);
    lcdData(((limiteSup / 10) % 10) + 48);
    lcdData(((limiteSup / 1) % 10) + 48);
    lcdData('L');
    lcdData(((limiteInf / 1000) % 10) + 48);
    lcdData(((limiteInf / 100) % 10) + 48);
    lcdData(((limiteInf / 10) % 10) + 48);
    lcdData(((limiteInf / 1) % 10) + 48);
    lcdCommand(0xC0);
    lcdData('C');
    lcdData(':');
    if (cooler == 1) {
        lcdData('0');
        lcdData('1');
        lcdData('0');
        lcdData('0');
    } else {
        lcdData('0');
        lcdData('0');
        lcdData('0');
        lcdData('0');
    }
    lcdData('A');
    lcdData(':');
    if (resis == 1) {
        lcdData('0');
        lcdData('1');
        lcdData('0');
        lcdData('0');
    } else {
        lcdData('0');
        lcdData('0');
        lcdData('0');
        lcdData('0');
    }

}

unsigned int lerTemperatura(void) {
    return adcRead() / 2;
}

void main(void) {

    lcdInit();
    adcInit();
    pwmInit();
    kpInit();
    pwmFrequency(1000);
    unsigned int tecla = 16;
    float i;
    unsigned int t;
    ConfiguraLimiteSuperior(31);
    ConfiguraLimiteInferior(28);

    for (;;) {
        kpDebounce();
# 105 "main.c"
        t = lerTemperatura();

        printInt(t);

        AtualizarSistema();
        for (i = 0; i < 1000; i++) {
        }

    }
}
