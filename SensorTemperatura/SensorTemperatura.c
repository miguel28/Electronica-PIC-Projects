const char Segments[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x47,0x7F,0x67,0x01};
int Temperute,i;
char Dec, Uni;

void separateunits()
{
    Dec=Temperute/10;
    Uni=Temperute-(Dec*10);
    if(Dec>10)Dec=10;
}

void main() {
     unsigned short temp_res;
     TRISA=0x3F;
     ADCON0=0x40; // fosc/8 --> see datasheet for other clock - fosc is defined by 2 bits in ADCON0 (6..7) and 1 bit (6) in ADCON1..
     ADCON1=0x84; // AN0/AN1/AN3/Vref+=VDD/Vref-=VSS - remaining inputs on PORTA/PORTE will be digital
               // Configure other AN pins as digital I/O
     TRISD=0x00;
     TRISB=0x00;
     TRISC=0xFF;
     PORTB=0x00;
     PORTD=0x00;

     PORTB=0xFF;
     Delay_ms(1000);

     PORTB=Segments[2];
     PORTD=Segments[8];
     Delay_ms(1000);

     while(1)
     {
         //// Triger 10 us min
         temp_res = ADC_Read(2) >> 2;
         //Temperute=PORTC;
         Temperute=temp_res;
         separateunits();
         PORTB=Segments[Uni];
         //PORTB=temp_res;
         PORTD=Segments[Dec];
         Delay_ms(500);
     }
}