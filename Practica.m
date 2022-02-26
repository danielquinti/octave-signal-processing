%Paso 1


fs = 48000; % Frecuencia de muestreo utilizada en el DVD en Hz.
Ts = 1 / fs; %Periodo de muestreo: inverso de la frec. muestreo en Hz
T = 1; %Duración de la señal en segundos
f1 = 460; %Frecuencia de la señal senoidal 1
f2 = 575; %Frecuencia de la señal senoidal 2
f3 = 690; %Frecuencia de la señal senoidal 3
f4 = 920; %Frecuencia de la señal senoidal 4
A = 0.1; %Amplitud de la señal senoidal

flow=600; %Frecuencia de corte (Hz) del filtro paso bajo
fhigh=690; %Frecuencia de corte (Hz) del filtro paso alto

t = Ts:Ts:T; %Vector eje tiempo
L = length(t); %Longitud del vector t. Comprobar que sea igual a fs*T
xdet1 = A * cos(2 * pi * f1 * t); %Generación de x1(t)
xdet2 = A * cos(2 * pi * f2 * t); %Generación de x2(t)
xdet3 = A * cos(2 * pi * f3 * t); %Generación de x3(t)
xdet4 = A * cos(2 * pi * f4 * t); %Generación de x4(t)
xdet = xdet1 + xdet2 + xdet3 + xdet4;
#{
figure;
subplot(511)
plot(t, xdet1) %Dibujo de x1(t)
axis([0 0.1 -0.5 0.5]) %Ajusta los ejes para la correcta visualización de x1(t)
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
title('Señal de entrada en el dominio del tiempo') %Etiquetado de figura

subplot(512)
plot(t, xdet2) %Dibujo de x2(t)
axis([0 0.1 -0.5 0.5]) %Ajusta los ejes para la correcta visualización de x2(t)
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
title('Señal de entrada en el dominio del tiempo') %Etiquetado de figura

subplot(513)
plot(t, xdet3) %Dibujo de x3(t)
axis([0 0.1 -0.5 0.5]) %Ajusta los ejes para la correcta visualización de x3(t)
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
title('Señal de entrada en el dominio del tiempo') %Etiquetado de figura

subplot(514)
plot(t, xdet4) %Dibujo de x4(t)
axis([0 0.1 -0.5 0.5]) %Ajusta los ejes para la correcta visualización de x4(t)
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
title('Señal de entrada en el dominio del tiempo') %Etiquetado de figura

subplot(515)
plot(t, xdet) %Dibujo de x(t)
axis([0 0.1 -0.5 0.5]) %Ajusta los ejes para la correcta visualización de x(t)
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
title('Señal de entrada en el dominio del tiempo') %Etiquetado de figura
#}
#{
sound(xdet1,fs) %Permite escuchar x1(t)
pause(1)
sound(xdet2,fs) %Permite escuchar x2(t)
pause(1)
sound(xdet3,fs) %Permite escuchar x3(t)
pause(1)
sound(xdet4,fs) %Permite escuchar x4(t)
pause(1)
sound(xdet,fs) %Permite escuchar x(t)
pause(1)
#}
%Paso 2
Xdef1 = fftshift(fft(xdet1)); % Transformada de Fourier de xdet1
Xdef2 = fftshift(fft(xdet2)); % Transformada de Fourier de xdet2
Xdef3 = fftshift(fft(xdet3)); % Transformada de Fourier de xdet3
Xdef4 = fftshift(fft(xdet4)); % Transformada de Fourier de xdet4
Xdef = fftshift(fft(xdet)); % Transformada de Fourier de xdet
f = -fs / 2 + fs / L:fs / L:fs / 2; %Declaración del eje de frecuencias
#{
figure;
subplot(511)
plot(f, abs(Xdef1) / max(abs(Xdef1))); %Dibujo del módulo de Xdef1
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')

subplot(512)
plot(f, abs(Xdef2) / max(abs(Xdef2))); %Dibujo del módulo de Xdef2
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')

subplot(513)
plot(f, abs(Xdef3) / max(abs(Xdef3))); %Dibujo del módulo de Xdef3
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')

subplot(514)
plot(f, abs(Xdef4) / max(abs(Xdef4))); %Dibujo del módulo de Xdef4
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')
#}
figure(1)
plot(f, abs(Xdef) / max(abs(Xdef))); %Dibujo del módulo de Xdef
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')

#Paso 3

Hdeflow = zeros(1, L/2);
Hdeflow(1:flow / fs*L) = ones(1, flow / fs*L);
Hdeflow = [fliplr(Hdeflow) Hdeflow];
Hdefhigh = ones(1, L/2);
Hdefhigh(1:fhigh / fs*L) = zeros(1, fhigh / fs * L);
Hdefhigh = [fliplr(Hdefhigh) Hdefhigh];

Hdeflow1 = zeros(1, L/2);
Hdeflow1(1:fhigh / fs*L) = ones(1, fhigh / fs*L);
Hdeflow1 = [fliplr(Hdeflow1) Hdeflow1];
Hdefhigh1 = ones(1, L/2);
Hdefhigh1(1:flow / fs*L) = zeros(1, flow / fs * L);
Hdefhigh1 = [fliplr(Hdefhigh1) Hdefhigh1];


Hdefband = Hdeflow1 .* Hdefhigh1;

Hdefelim = Hdeflow + Hdefhigh;

figure;

subplot(411)
plot(f, abs(Hdeflow));
axis([-1000 1000 0 1.1])

subplot(412)
plot(f, abs(Hdefhigh));
axis([-1000 1000 0 1.1])

subplot(413)
plot(f, abs(Hdefband));
axis([-1000 1000 0 1.1])
#{
subplot(414)
plot(f, abs(Hdefelim));
axis([-1000 1000 0 1.1])
#}
%Paso 4

Ydef=Xdef.*Hdeflow;

figure;
plot(f,abs(Ydef)/max(abs(Ydef)));
xlabel('Frec. (Hz)')
ylabel('Amplitud')
axis([-1000 1000 0 1.1])
#sumas en tiempo, pasas a frecuencia con tf, aplicas el filtro y reproduces en tiempo
#}

#Paso 5
#{
ydet=ifft(fftshift(Ydef));%Cálculo de la transformada de Fourier inversa
ydet=real(ydet);;
figure(2)
plot(t,ydet);
xlabel('Tiempo')
ylabel('Amplitud')
axis([0 0.1 -0.5 0.5])
pause;
#Pausa previa a la audición de y(t). Pulse cualquier tecla para continuar
sound(ydet,fs);
#}