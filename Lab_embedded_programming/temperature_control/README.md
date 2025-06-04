
# Temperature Control System with PWM and Cooler

This project was developed as part of an academic assignment using embedded C programming with the **PIC18F4520** microcontroller. The system implements a temperature control mechanism by reading analog signals (ADC), activating a cooler using **PWM**, displaying information on a **16x2 LCD**, and receiving user input via a **keypad**.

## Features

- 📟 Displays current temperature on the LCD.
- 🌡️ Configurable upper and lower temperature thresholds.
- 🧊 Automatically turns the cooler on/off based on temperature.
- 🔢 User input via a matrix keypad.
- 💡 Uses PWM to control cooler speed.
- 🧠 Modularized code with drivers (`adc`, `lcd`, `pwm`, `keypad`, `contTemp`).

## Project Structure

- `main.c`: Main function and control loop.
- `adc.c/.h`: Analog-to-digital conversion module.
- `pwm.c/.h`: PWM control for the cooler.
- `lcd.c/.h`: LCD display driver.
- `keypad.c/.h`: Matrix keypad input handler.
- `contTemp.c/.h`: Temperature control logic.
- `config.h`: Pin and clock configuration.
- `pic18f4520.h`: PIC-specific definitions.

## How It Works

1. The system reads the temperature through analog conversion (ADC).
2. The current temperature is compared to the configured thresholds.
3. If it exceeds the upper limit, the cooler is activated (PWM on).
4. If it drops below the lower limit, the cooler is turned off.
5. The LCD continuously displays:
   - Current temperature.
   - Configured upper and lower limits.
   - Cooler state.

## Requirements

- MPLAB X IDE
- XC8 Compiler
- Hardware:
  - PIC18F4520
  - 16x2 LCD Display
  - Cooler
  - Matrix Keypad
  - Analog Temperature Sensor
  - Suitable power supply

## Compilation and Upload

1. Open the project in MPLAB X.
2. Compile using the XC8 compiler.
3. Upload to the PIC using a compatible programmer (e.g., PICkit 3/4).

## Author

Project developed by Talison for the Embedded Systems course — Universidade Federal de Itajubá (UNIFEI).
