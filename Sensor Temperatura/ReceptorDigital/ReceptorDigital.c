#define MINTEMP 10
const char Segments[]={0x77,0x11,0x6B,0x6E,0x5C,0x3E,0x1F,0x64,0x7F,0x7C};
char temp1,temp2,temp3;

char i;

void portstate()
{
     if(temp1>=MINTEMP)PORTA=temp3|0x04;
     else PORTA=temp3;

}

void main() {
     TRISA=0x00;
     TRISB=0xFF;
     PORTA=0x00;
     delay_ms(1000);
     for(;;)
     {
         temp1=PORTB;
         delay_ms(100);
         for(i=0;i<8;i++)
         {
              temp2=temp1>>i;
              if(temp2&0x01==0x01)temp3=0x03;
              else temp3=0x01;
              portstate();
              delay_ms(1);
              temp3=0x00;
              portstate();
              delay_ms(1);

                
                
              /*PORTA=temp2&0x02;
              delay_ms(100);
              PORTA=0x00;
              delay_ms(100); */
              //PORTA=temp2&0x02;
              //delay_ms(1000);
         }
     }
}