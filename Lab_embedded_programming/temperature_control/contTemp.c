#include "adc.h"
#include "pwm.h"
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