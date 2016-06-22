const char Segments[]={0x77,0x11,0x6B,0x6E,0x5C,0x3E,0x1F,0x64,0x7F,0x7C};
char i;
int j;
char dec,uni;

void separateunits()
{
    dec=i/10;
    uni=i-(dec*10);
}

void main() {
     TRISA=0x0C;
     TRISB=0x00;
     
     for(;;)
     {
         for(i=0;i<99;i++)
         {
              separateunits();
              for(j=0;j<100;j++){
                  PORTB=Segments[dec];
                  RA0_bit=1;
                  RA1_bit=0;
                  delay_ms(5);
                  PORTB=Segments[uni];
                  RA0_bit=0;
                  RA1_bit=1;
                  delay_ms(5);
              }

         }

     }

}