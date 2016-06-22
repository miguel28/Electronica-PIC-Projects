const char Segments[]={0x77,0x11,0x6B,0x6E,0x5C,0x3E,0x1F,0x64,0x7F,0x7C,0x3B,0x3B,0x3B,0x3B,0x3B};
const char BITS[]={1,2,4,8,16,32,64,128};
char j,tempchar,tempchar2;
int dec,uni;

void separateunits()
{
    dec=tempchar/10;
    uni=tempchar-(dec*10);
}

void main() {
     TRISA=0b00011100;
     TRISB=0x00;
     RA0_bit=1;
     RA1_bit=0;
     PORTB=Segments[4];
     delay_ms(500);
     PORTB=Segments[2];
     delay_ms(450);
     while(1)
     {
         separateunits();
         for(j=0;j<45;j++)
         {
              PORTB=Segments[dec];
              RA0_bit=1;
              RA1_bit=0;
              delay_ms(1);
              PORTB=Segments[uni];
              RA0_bit=0;
              RA1_bit=1;
              delay_ms(1);
         }
         for(j=0;j<8;j++){
              while(RA2_bit==0);
              if(RA3_bit==0x01)tempchar2=BITS[j];
              else tempchar2=0x00;
              tempchar2<<j;
              tempchar|=tempchar2;
              while(RA2_bit==1);
         }
     }
}