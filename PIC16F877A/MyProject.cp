#line 1 "C:/Users/Mike/Desktop/PICS/PIC16F877A/MyProject.c"
void main() {
 TRISC = 0 ;
 PORTC = 0 ;
 while(1)
 {
 PORTC=0xFF;
 Delay_ms(1000);
 PORTC=0x00;
 Delay_ms(1000);
 }
}
