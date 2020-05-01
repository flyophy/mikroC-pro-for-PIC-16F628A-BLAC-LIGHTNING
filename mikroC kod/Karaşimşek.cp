#line 1 "C:/Users/EMRE/Desktop/karaþimþek/mikroC kod/Karaþimþek.c"
char i,led;

void kurulum()
{
 TRISB=0;
 PORTB=0;
 led=1;
}

void main()
{
 kurulum();
 while(1)
 {
 for(i=0;i<7;i++)
 {
 PORTB=led;
 led=led<<1;
 delay_ms(70);
 }

 for(i=0;i<7;i++)
 {
 PORTB=led;
 led=led>>1;
 delay_ms(70);
 }
 }
}
