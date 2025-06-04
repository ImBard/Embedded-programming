/* 
 * File:   main.c
 * Author: aluno
 *
 * Created on 27 de Maio de 2025, 16:05
 */

#include "config.h"
#include "adc.h"
#include "lcd.h"
#include "pic18f4520.h"
#include "pwm.h"
#include "keypad.h"
#include "contTemp.h"

/*
 * 
 */

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
        //        if (kpRead() != tecla) {
        //            tecla = kpRead();;
        //
        //            if (BitTst(tecla, 2)) { // liga cooler
        //                pwmSet1(100);
        //            }
        //
        //            if (BitTst(tecla, 3)) {
        //                pwmSet1(0);
        //            }
        //
        //            if (BitTst(tecla, 4)) {
        //                pwmSet2(100);
        //            }
        //
        //            if (BitTst(tecla, 5)) {
        //                pwmSet2(0);
        //            }
        //
        t = lerTemperatura();
        //
        printInt(t);

        AtualizarSistema();
        for (i = 0; i < 1000; i++) {
        }
        //        }
    }
}

