const char BITS[]={1,2,4,8,16,32,64,128};
char Data,Data2,i,temp1;
void main() {
     ADCON1=0x06;

     TRISA=0x01;
     TRISB=0x00;
     TRISC=0x00;
     PORTB=0x00;
     PORTC=0x00;
Start:
     PORTA=0x00;

     Data=0x00;
     Data2=0x00;
     
     PORTA=0x02; //Set Latch HIGH
     Delay_us(12);
     PORTA=0x00;

     if (Button(&PORTA, 0, 1, 1))temp1=0;
     else temp1=1;
     Data|=temp1;
     
     for(i=1;i<8;i++){//Read();
          Delay_us(6);
          PORTA=0x04;
          temp1=0;
          if (RA0_bit)temp1=0;
          else temp1=BITS[i];
          Data|=temp1;
          Delay_us(6);
          PORTA=0x00;
     }
     temp1=0x00;
     for(i=0;i<8;i++){//Read();
          Delay_us(6);
          PORTA=0x04;
          temp1=0;
          if (RA0_bit)temp1=0;
          else temp1=BITS[i];
          Data2|=temp1;
          Delay_us(6);
          PORTA=0x00;
     }
     PORTB=Data2;
     PORTC=Data;
     goto Start;
}