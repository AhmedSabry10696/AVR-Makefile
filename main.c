#ifndef __AVR_ATmega32__
    #define __AVR_ATmega32__
#endif

#define F_CPU 8000000Ul
#include <avr/io.h>
#include <util/delay.h>

int main(void)
{

    DDRB = 0xFF;

    while (1)
    {
        PORTB = 0xFF;
        _delay_ms(500);
        PORTB = 0x00;
        _delay_ms(500);
    }
    
    return 0;
}