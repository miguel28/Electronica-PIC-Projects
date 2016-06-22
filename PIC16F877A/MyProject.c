void main() {
     TRISC = 0 ; // set PORTC as output
     PORTC = 0 ; // clear PORTC
     while(1)
     {
         PORTC=0xFF;
         Delay_ms(1000);
         PORTC=0x00;
         Delay_ms(1000);
     }
}