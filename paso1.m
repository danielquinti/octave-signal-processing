%Ts periodo de muestreo en s. Cada Ts segundos se produce una muestra
%fs frecuencia de muestreo en Hz. se producen fs muestras por segundo
%T duracion de la input en segundos
%A amplitud de la input senoidal
%el tamaño del vector t debe ser igual al producto de la frecuencia 
%de muestreo por la duración de la input (el número total de muestras)
%L=fs*T debe ser un numero entero
%esto se consigue si t=Ts:Ts:T (desde ts hasta T dando saltos de Ts)
%si multiplicas algo por el vector t, el resultado es un vector de tamaño L
fs=48000
Ts=1/fs;   
T=1;             
A=0.1;
%Vector eje tiempo
#Desde Ts dando saltos de Ts hasta llegar a T, resulta en una longitud fs*T   
t=Ts:Ts:T;
%Longitud del vector t. 
L=length(t);
#Comprobar que sea igual a fs*T
equality=(fs*T==L);
#Cuatro señales con frecuencias distintas
input1=A*cos(2*pi*440*t);
input2=A*cos(2*pi*550*t);
input3=A*cos(2*pi*660*t); 
input4=A*cos(2*pi*880*t);

#Se suman las cuatro señales
output=input1+input2+input3+input4;

figure(1)
subplot (5, 1, 1)
plot(t,input1)
axis([0 0.1 -0.5 0.5]) %entre 0 y 1 y entre -0.5 y 0.5
xlabel('Time(s)')
ylabel('Amplitude')
title('440Hz')
sound(input1,fs)

subplot (5, 1, 2)
plot(t,input2)
axis([0 0.1 -0.5 0.5])        %Ajusta los ejes para la correcta visualización de x(t)
xlabel('Time(s)')       %Etiquetado del eje horizontal (tiempo)     
ylabel('Amplitude')     %Etiquetado del eje vertical
title('550Hz')%Etiquetad figura
sound(input2,fs)

subplot (5, 1, 3)
plot(t,input3)
axis([0 0.1 -0.5 0.5])        %Ajusta los ejes para la correcta visualización de x(t)
xlabel('Time(s)')       %Etiquetado del eje horizontal (tiempo)     
ylabel('Amplitude')     %Etiquetado del eje vertical
title('660Hz')%Etiquetad figura
sound(input3,fs)

subplot (5, 1, 4)
plot(t,input4)
axis([0 0.1 -0.5 0.5])        %Ajusta los ejes para la correcta visualización de x(t)
xlabel('Time(s)')       %Etiquetado del eje horizontal (tiempo)     
ylabel('Amplitude')     %Etiquetado del eje vertical
title('880Hz')%Etiquetad figura
sound(input4,fs)

subplot(5,1,5)
plot(t,output)
axis([0 0.1 -0.5 0.5])        %Ajusta los ejes para la correcta visualización de x(t)
xlabel('Time(s)')       %Etiquetado del eje horizontal (tiempo)     
ylabel('Amplitude')     %Etiquetado del eje vertical
title('Output')%Etiquetad figura
sound(output,fs)