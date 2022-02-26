%Ts periodo de muestreo en s. Cada Ts segundos se produce una muestra
%fs frecuencia de muestreo en Hz. se producen fs muestras por segundo
%T duracion de la signal en segundos
%A amplitud de la signal senoidal
%el tamaño del vector t debe ser igual al producto de la frecuencia 
%de muestreo por la duración de la signal (el número total de muestras)
%L=fs*T debe ser un numero entero
%esto se consigue si t=Ts:Ts:T (desde ts hasta T dando saltos de Ts)
%si multiplicas algo por el vector t, el resultado es un vector de tamaño L
% Frecuencia de muestreo utilizada en el DVD en Hz. 
fs=48000;
%Periodo de muestreo: inverso de la frec. muestreo en Hz
Ts=1/fs;   
%Duración de la señal en segundos       
T=1;             
%Amplitud de la señal senoidal
A=0.1;
%Vector eje tiempo
#Desde Ts dando saltos de Ts hasta llegar a T, resulta en una longitud fs*T   
t=Ts:Ts:T;
%Longitud del vector t. 
L=length(t);
#Comprobar que sea igual a fs*T
equality=(fs*T==L);
#Frecuencia
f=440;
#Cuatro señales con frecuencias distintas
input=A*cos(2*pi*f*t);
fourier_transform=fftshift(fft(input));          % Transformada de Fourier de xdet
%El eje de frecuencias tienen que ser L puntos equiespaciados por fs/L entre -fs/2 y fs/2
f=-fs/2+fs/L:fs/L:fs/2;  
plottable_fourier_transform=abs(fourier_transform)/max(abs(fourier_transform));#Dibujo del módulo de Xdef dividido entre su máximo valor, para que su máximo 
figure(1)
subplot (2, 1, 1)
plot(t,input)
axis([0 0.1 -0.5 0.5])        %Ajusta los ejes para la correcta visualización de x(t)
xlabel('Time(s)')       %Etiquetado del eje horizontal (tiempo)     
ylabel('Amplitud')     %Etiquetado del eje vertical
title('Time domain')%Etiquetad figura

subplot (2, 1, 2)         
plot(f,plottable_fourier_transform);
#Dibujo del módulo de Xdef dividido entre 
#su máximo valor, para que su máximo valor sea 1
axis([-1000 1000 0 1.1]);%Ajuste de los ejes de la figura
xlabel('Frequency')       %Etiquetado del eje horizontal (tiempo)     
ylabel('Amplitud')     %Etiquetado del eje vertical
title('Frequency domain')%Etiquetad figura