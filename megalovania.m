% Frecuencia de muestreo utilizada en el DVD en Hz. 
fs=48000;
%Periodo de muestreo: inverso de la frec. muestreo en Hz
Ts=1/fs;   
%Duración de la señal en segundos       
T=0.3;             
%Amplitud de la señal senoidal
A=1;
%Vector eje tiempo
#Desde Ts dando saltos de Ts hasta llegar a T, resulta en una longitud fs*T   
t=Ts:Ts:T;

D4=A*cos(2*pi*293.66*t);
D5=A*cos(2*pi*587.33*t);
silence=A*cos(2*pi*0*t);
A4=A*cos(2*pi*440*t);
G4sharp=A*cos(2*pi*415.30*t);
G4=A*cos(2*pi*392*t);
F4=A*cos(2*pi*349.23*t);
C4=A*cos(2*pi*261.63*t);
B3=A*cos(2*pi*246.94*t);
A3sharp=A*cos(2*pi*233.08*t);

for i=1:2
sound(D4,fs)
sound(D4,fs)
sound(D5,fs)
sound(silence,fs)
sound(A4,fs)
sound(silence,fs)
sound(silence,fs)
sound(G4sharp,fs)
sound(silence,fs)
sound(G4,fs)
sound(silence,fs)
sound(F4,fs)
sound(silence,fs)
sound(D4,fs)
sound(F4,fs)
sound(G4,fs)

sound(C4,fs)
sound(C4,fs)
sound(D5,fs)
sound(silence,fs)
sound(A4,fs)
sound(silence,fs)
sound(silence,fs)
sound(G4sharp,fs)
sound(silence,fs)
sound(G4,fs)
sound(silence,fs)
sound(F4,fs)
sound(silence,fs)
sound(D4,fs)
sound(F4,fs)
sound(G4,fs)

sound(B3,fs)
sound(B3,fs)
sound(D5,fs)
sound(silence,fs)
sound(A4,fs)
sound(silence,fs)
sound(silence,fs)
sound(G4sharp,fs)
sound(silence,fs)
sound(G4,fs)
sound(silence,fs)
sound(F4,fs)
sound(silence,fs)
sound(D4,fs)
sound(F4,fs)
sound(G4,fs)

sound(A3sharp,fs)
sound(A3sharp,fs)
sound(D5,fs)
sound(silence,fs)
sound(A4,fs)
sound(silence,fs)
sound(silence,fs)
sound(G4sharp,fs)
sound(silence,fs)
sound(G4,fs)
sound(silence,fs)
sound(F4,fs)
sound(silence,fs)
sound(D4,fs)
sound(F4,fs)
sound(G4,fs)
endfor