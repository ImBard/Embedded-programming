#include "config.h"
#include "lcd.h"
#include "rtc.h"
#include "serial.h"

void main(void)
{
  float i;
  unsigned char dadoSerial;
  char data[6], hora[6];
  unsigned char position = 0;
  unsigned char option;

  // Inicializacoes
  lcdInit();
  serialInit();
  rtcInit();
  rtcPutSeconds(0);
  rtcPutMinutes(0);
  rtcPutHours(0);
  for (;;)
  {
    dadoSerial = serialRead();
    if (dadoSerial != 0)
    { // Se dado e valido
      serialSend(dadoSerial);
      if (option != 'H' && option != 'D')
      {
        option = dadoSerial;
        position = 0;
      }
      if (option == 'H' && dadoSerial != 'H')
      {
        hora[position++] = dadoSerial;
      }
      if (option == 'D' && dadoSerial != 'D')
      {
        data[position++] = dadoSerial;
      }
    }
    if (position == 6)
    {
      if (option == 'D')
      {
        rtcPutDate((data[0] - 48) * 10 + (data[1] - 48));
        rtcPutMonth((data[2] - 48) * 10 + (data[3] - 48));
        rtcPutYear((data[4] - 48) * 10 + (data[5] - 48));
      }
      if (option == 'H')
      {
        rtcPutHours((hora[0] - 48) * 10 + (hora[1] - 48));
        rtcPutMinutes((hora[2] - 48) * 10 + (hora[3] - 48));
        rtcPutSeconds((hora[4] - 48) * 10 + (hora[5] - 48));
      }

      position = 0;
    }
    // Le horario do RTC
    lcdCommand(0x80);
    lcdData(((rtcGetHours() / 10) % 10) + 48);
    lcdData((rtcGetHours() % 10) + 48);
    lcdData(':');
    lcdData(((rtcGetMinutes() / 10) % 10) + 48);
    lcdData((rtcGetMinutes() % 10) + 48);
    lcdData(':');
    lcdData(((rtcGetSeconds() / 10) % 10) + 48);
    lcdData((rtcGetSeconds() % 10) + 48);
    lcdCommand(0xc0);

    lcdData(((rtcGetDate() / 10) % 10) + 48);
    lcdData((rtcGetDate() % 10) + 48);
    lcdData('/');
    lcdData(((rtcGetMonth() / 10) % 10) + 48);
    lcdData((rtcGetMonth() % 10) + 48);
    lcdData('/');
    lcdData(((rtcGetYear() / 10) % 10) + 48);
    lcdData((rtcGetYear() % 10) + 48);

    //        for (i = 0; i < 1000; i++);
  }
}