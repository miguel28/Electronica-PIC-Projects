#line 1 "C:/Users/Silva/Desktop/Pics/SensorTemperatura/SensorTemperatura.c"
const char Segments[]={0xb3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x47,0x7F,0x67,0x01};
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
 ADCON0=0x40;
 ADCON1=0x84;

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

 temp_res = ADC_Read(2) >> 2;

 Temperute=temp_res;
 separateunits();
 PORTB=Segments[Uni];

 PORTD=Segments[Dec];
 Delay_ms(500);
 }
}
