/* 
 * File:   contTemp.h
 * Author: aluno
 *
 * Created on 27 de Maio de 2025, 17:17
 */

#ifndef CONTTEMP_H
#define	CONTTEMP_H

unsigned char limiteSup;
unsigned char limiteInf;

unsigned int cooler;
unsigned int resis;

void ConfiguraLimiteSuperior(unsigned char temp);
void ConfiguraLimiteInferior(unsigned char temp);
void AtualizarSistema(void); //Controla a temperatura

#endif	/* CONTTEMP_H */

