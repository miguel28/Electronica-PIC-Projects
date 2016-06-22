#line 1 "C:/Users/Mike/Desktop/PICS/Sensor Temperatura/DisplayTemp4/DisplayTemp4.c"
const char Segments[]={0x77,0x11,0x6B,0x6E,0x5C,0x3E,0x1F,0x64,0x7F,0x7C};
const char BITS[]={1,2,4,8,16,32,64,128};
char i;

unsigned short dec,uni;
char tempchar,tempchar2;

void separateunits();

void main() {
TRISA=0b00011100;
TRISB=0x00;
RA0_bit=1;
PORTB=Segments[1];
delay_ms(200);
PORTB=Segments[2];
delay_ms(200);
PORTB=Segments[3];
delay_ms(200);
PORTB=Segments[4];
delay_ms(200);
PORTB=Segments[5];
delay_ms(200);
tempchar=1;

while(1)
{
separateunits();
for(i=0;i<45;i++)
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
tempchar=0;
for(i=0;i<8;i++){
while(RA2_bit==0);
if(RA3_bit==0x01)tempchar2=BITS[i];
else tempchar2=0x00;

tempchar|=tempchar2;
while(RA2_bit==1);
}

}
}

void separateunits()
{
 dec=tempchar/10;
 uni=tempchar-(dec*10);
}
