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
        //////Letra I
        PORTB=LetraI;
        PORTA=0x01;
        Delay_ms(1000);
        
        //////Letra T
        PORTB=LetraT;
        PORTA=0x02;
        Delay_ms(1000);
        
        //////Letra C
        PORTB=LetraC;
        PORTA=0x04;
        Delay_ms(1000);
        
        //////Letra J
        PORTB=LetraJ;
        PORTA=0x08;
        Delay_ms(1000);

        for(i=0; i< 600; i++)
        {
             //////Letra I
             PORTB=LetraI;
             PORTA=0x01;
             Delay_ms(1);

             //////Letra T
             PORTB=LetraT;
             PORTA=0x02;
             Delay_ms(1);

             //////Letra C
             PORTB=LetraC;
             PORTA=0x04;
             Delay_ms(1);

             //////Letra J
             PORTB=LetraJ;
             PORTA=0x08;
             Delay_ms(1);

        }
        for(i=0; i< 8; i++)
        {
             //////Letra I
             PORTB=Anim[i];
             PORTA=0x01;
             Delay_ms(50);
        }
        //////Letra I
        PORTB=LetraI;
        PORTA=0x01;
        Delay_ms(1000);
        for(i=0; i< 8; i++)
        {
             //////Letra T
             PORTB=Anim[i];
             PORTA=0x02;
             Delay_ms(50);
        }
        //////Letra T
        PORTB=LetraT;
        PORTA=0x02;
        Delay_ms(1000);
        for(i=0; i< 8; i++)
        {
             //////Letra C
             PORTB=Anim[i];
             PORTA=0x04;
             Delay_ms(50);
        }
        //////Letra C
        PORTB=LetraC;
        PORTA=0x04;
        Delay_ms(1000);
        for(i=0; i< 8; i++)
        {
             //////Letra J
             PORTB=Anim[i];
             PORTA=0x08;
             Delay_ms(50);
        }
        //////Letra J
        PORTB=LetraJ;
        PORTA=0x08;
        Delay_ms(1000);
    }
}