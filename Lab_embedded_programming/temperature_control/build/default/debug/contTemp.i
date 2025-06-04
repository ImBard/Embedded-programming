# 1 "contTemp.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/opt/microchip/mplabx/v6.10/packs/Microchip/PIC18Fxxxx_DFP/1.4.151/xc8/pic/include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "contTemp.c" 2
# 1 "./adc.h" 1
# 22 "./adc.h"
 void adcInit(void);
 int adcRead(void);
# 2 "contTemp.c" 2
# 1 "./pwm.h" 1
# 23 "./pwm.h"
 void pwmSet1(unsigned char porcento);
 void pwmSet2(unsigned char porcento);
 void pwmFrequency(unsigned int freq);
 void pwmInit(void);
# 3 "contTemp.c" 2
unsigned char limiteSup;
unsigned char limiteInf;

unsigned int cooler;
unsigned int resis;

void ConfiguraLimiteSuperior(unsigned char temp) {
    limiteSup = temp;
}
void ConfiguraLimiteInferior(unsigned char temp) {
    limiteInf = temp;
}
void AtualizarSistema(void) {
    unsigned int temp = adcRead() / 2;

    if (temp > limiteSup) {
        pwmSet1(100);
        cooler = 1;
    }

    if (temp < limiteSup && temp > limiteInf) {
        cooler = 0;
        resis = 0;
        pwmSet1(0);
        pwmSet2(0);
    }

    if (temp < limiteInf) {
        resis = 1;
        pwmSet2(100);
    }
}
