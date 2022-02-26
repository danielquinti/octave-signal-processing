clear all;
close all;
m=1;
g=90;
r=g*pi/180
z=m*exp(j*r)
%z=1*exp(j*90*pi/180)
plot(z,'o');
axis([-3 3 -3 3]);
grid;
xlabel('Parte real');
ylabel('Parte imaginaria');