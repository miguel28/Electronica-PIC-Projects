#line 1 "C:/Users/Mike/Desktop/PICS/NESController v1.01/NesController.c"

const char BITS[]={1,2,4,8,16,32,64,128};
char Data,i,temp1;
void main() {
 TRISA=0x01;
 TRISB=0x00;
Start:
 PORTA=0x00;
 Data=0x00;

 PORTA=0x02;
 Delay_us(12);
 PORTA=0x00;

 if (Button(&PORTA, 0, 1, 1))temp1=0;
 else temp1=1;
 Data|=temp1;
 for(i=1;i<8;i++){
 Delay_us(6);
 PORTA=0x04;
 temp1=0;
 if (Button(&PORTA, 0, 1, 1))temp1=0;
 else temp1=BITS[i];
 Data|=temp1;
 Delay_us(6);
 PORTA=0x00;
 }
 PORTB=Data;
 goto Start;
}
