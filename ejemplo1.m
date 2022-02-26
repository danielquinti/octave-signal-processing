clear all;
close all;
z=1+2*j;
x=real(z);
y=imag(z);
m=abs(z)
a1=atan(y/x)
%si x es menor que 0 hay que corregir atan añadiendo pi
a1=angle(z)
%angle siempre devuelve el resultado correcto
plot(z,'o');
axis([-3 3 -3 3]);
grid;
xlabel('Parte real');
ylabel('Parte imaginaria');
a1*180/pi;

clear all;
close all;
m=1;
g=90;
r=g*pi/180;
z=m*exp(j*r);
plot(z,'o');
axis([-3 3 -3 3]);
grid;
xlabel('Parte real');
ylabel('Parte imaginaria');

