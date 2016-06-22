#line 1 "C:/Users/Mike/Desktop/ITCJ/ITCJ.c"
char LetraI=0x06;
char LetraT=0x78;
char LetraC=0x58;
char LetraJ=0x1E;

char Anim[8]={0x01,0x03,0x07,0x0F,0x1F,0x3F,0x7F} ;
int i;
void main() {
 TRISA=0x00;
 TRISB=0x00;

 while(1)
 {

 PORTB=LetraI;
 PORTA=0x01;
 Delay_ms(1000);


 PORTB=LetraT;
 PORTA=0x02;
 Delay_ms(1000);


 PORTB=LetraC;
 PORTA=0x04;
 Delay_ms(1000);


 PORTB=LetraJ;
 PORTA=0x08;
 Delay_ms(1000);

 for(i=0; i< 600; i++)
 {

 PORTB=LetraI;
 PORTA=0x01;
 Delay_ms(1);


 PORTB=LetraT;
 PORTA=0x02;
 Delay_ms(1);


 PORTB=LetraC;
 PORTA=0x04;
 Delay_ms(1);


 PORTB=LetraJ;
 PORTA=0x08;
 Delay_ms(1);

 }
 for(i=0; i< 8; i++)
 {

 PORTB=Anim[i];
 PORTA=0x01;
 Delay_ms(50);
 }

 PORTB=LetraI;
 PORTA=0x01;
 Delay_ms(1000);
 for(i=0; i< 8; i++)
 {

 PORTB=Anim[i];
 PORTA=0x02;
 Delay_ms(50);
 }

 PORTB=LetraT;
 PORTA=0x02;
 Delay_ms(1000);
 for(i=0; i< 8; i++)
 {

 PORTB=Anim[i];
 PORTA=0x04;
 Delay_ms(50);
 }

 PORTB=LetraC;
 PORTA=0x04;
 Delay_ms(1000);
 for(i=0; i< 8; i++)
 {

 PORTB=Anim[i];
 PORTA=0x08;
 Delay_ms(50);
 }

 PORTB=LetraJ;
 PORTA=0x08;
 Delay_ms(1000);
 }
}
