# Embedded Programming Projects

This repository hosts all embedded-systems code and projects developed during my Computer Engineering degree program at the Federal University of Itajubá (UNIFEI).

## Contents

* **Lab\_embedded\_programming/**

  * **clock\_with\_date/**: Display a real-time clock and date on a 16×2 LCD using PIC18F4520.

## Getting Started

### Prerequisites

* MPLAB X IDE
* XC8 Compiler
* PIC18F4520 microcontroller and development board
* 16×2 LCD (LCD1602)
* PIC programmer (e.g., PICKit)
* PC with serial port or USB-to-serial adapter (for PuTTY)

### Building the Project

1. Clone the repository:

   ```bash
   git clone https://github.com/ImBard/Embedded-programming.git
   ```
2. Open the project in MPLAB X.
3. Configure the XC8 compiler toolchain.
4. Build the `clock_with_date` project to generate the `.hex` file.

### Programming the Microcontroller

1. Connect your PIC programmer to the PIC18F4520 development board.
2. Use MPLAB X or your preferred tool to program the generated `.hex` file onto the MCU.

### Usage

1. Connect the board’s UART pins to your PC’s serial interface.
2. Launch PuTTY (or any serial terminal) with these settings:

   * **Baud rate:** 57600
   * **Data bits:** 8
   * **Parity:** None
   * **Stop bits:** 1
3. To set the **time**, press **H**, then enter `HHMMSS` (e.g., `142530` for 14:25:30).
4. To set the **date**, press **D**, then enter `DDMMYY` (e.g., `230525` for 23/05/2025).
5. The LCD will update with the current clock and date.

## Project Structure

```
Embedded-programming/
├── Lab_embedded_programming/
│   └── clock_with_date/
│       ├── config.h
│       ├── lcd.h
│       ├── lcd.c
│       ├── rtc.h
│       ├── rtc.c
│       ├── serial.h
│       ├── serial.c
│       └── main.c
└── README.md
```

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
