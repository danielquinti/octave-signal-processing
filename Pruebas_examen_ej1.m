%suma de 3 señales
fs = 48000; % Frecuencia de muestreo utilizada en el DVD en Hz.
Ts = 1 / fs; %Periodo de muestreo: inverso de la frec. muestreo en Hz
T = 1; %Duración de la señal en segundos
A = 0.1; %Amplitud de la señal senoidal
flow=100; %Frecuencia de corte (Hz) del filtro paso bajo
fhigh=600; %Frecuencia de corte (Hz) del filtro paso alto

f1 = 300;

f2 = 440;

f3 = 550;

t = Ts:Ts:T; %Vector eje tiempo
L = length(t); %Longitud del vector t. Comprobar que sea igual a fs*T
xdet1 = A * cos(2 * pi * f1 * t); %Generación de x1(t)
xdet2 = A * cos(2 * pi * f2 * t); %Generación de x2(t)
xdet3 = A * cos(2 * pi * f3 * t); %Generación de x3(t)
xdet = xdet1 + xdet2 + xdet3;

figure;
subplot(411)
plot(t, xdet1) %Dibujo de x1(t)
axis([0 0.1 -0.5 0.5]) %Ajusta los ejes para la correcta visualización de x1(t)
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
title('Señal de entrada en el dominio del tiempo') %Etiquetado de figura

subplot(412)
plot(t, xdet2) %Dibujo de x2(t)
axis([0 0.1 -0.5 0.5]) %Ajusta los ejes para la correcta visualización de x2(t)
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
title('Señal de entrada en el dominio del tiempo') %Etiquetado de figura

subplot(413)
plot(t, xdet3) %Dibujo de x3(t)
axis([0 0.1 -0.5 0.5]) %Ajusta los ejes para la correcta visualización de x3(t)
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
title('Señal de entrada en el dominio del tiempo') %Etiquetado de figura

subplot(414)
plot(t, xdet) %Dibujo de x(t)
axis([0 0.1 -0.5 0.5]) %Ajusta los ejes para la correcta visualización de x(t)
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
title('Señal de entrada en el dominio del tiempo') %Etiquetado de figura

Xdef1 = fftshift(fft(xdet1)); % Transformada de Fourier de xdet1
Xdef2 = fftshift(fft(xdet2)); % Transformada de Fourier de xdet2
Xdef3 = fftshift(fft(xdet3)); % Transformada de Fourier de xdet3
Xdef4 = fftshift(fft(xdet4)); % Transformada de Fourier de xdet4
Xdef = fftshift(fft(xdet)); % Transformada de Fourier de xdet
f = -fs / 2 + fs / L:fs / L:fs / 2; %Declaración del eje de frecuencias

figure;
subplot(411)
plot(f, abs(Xdef1) / max(abs(Xdef1))); %Dibujo del módulo de Xdef1
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')

subplot(412)
plot(f, abs(Xdef2) / max(abs(Xdef2))); %Dibujo del módulo de Xdef2
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')

subplot(413)
plot(f, abs(Xdef3) / max(abs(Xdef3))); %Dibujo del módulo de Xdef3
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')

subplot(414)
plot(f, abs(Xdef) / max(abs(Xdef))); %Dibujo del módulo de Xdef
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')

%Para recuperar x1, paso bajo ideal
flow = 320;

Hdeflow = zeros(1, L/2);
Hdeflow(1:flow / fs*L) = ones(1, flow / fs*L);
Hdeflow = [fliplr(Hdeflow) Hdeflow];

figure;

subplot(411)
plot(f, abs(Xdef) / max(abs(Xdef))); %Dibujo del módulo de Xdef
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')

subplot(412)
plot(f, abs(Hdeflow));
axis([-1000 1000 0 1.1])

subplot(413)

Ydef1=Xdef.*Hdeflow;
plot(f,abs(Ydef1)/max(abs(Ydef1)));
xlabel('Frec. (Hz)')
ylabel('Amplitud')
axis([-1000 1000 0 1.1])

ydet1=ifft(fftshift(Ydef1)); %Cálculo de la transformada de Fourier inversa
ydet1=real(ydet1); %se utiliza para quitar los numeros complejos con una parte imaginaria pequeña que genera ifft

subplot(414)
plot(t,ydet1);
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
axis([0 0.1 -0.5 0.5])



%Para recuperar x3, paso alto ideal
fhigh = 500;

Hdefhigh = ones(1, L/2);
Hdefhigh(1:fhigh / fs*L) = zeros(1, fhigh / fs * L);
Hdefhigh = [fliplr(Hdefhigh) Hdefhigh];

figure;

subplot(411)
plot(f, abs(Xdef) / max(abs(Xdef))); %Dibujo del módulo de Xdef
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')

subplot(412)
plot(f, abs(Hdefhigh));
axis([-1000 1000 0 1.1])

subplot(413)

Ydef3=Xdef.*Hdefhigh;
plot(f,abs(Ydef3)/max(abs(Ydef3)));
xlabel('Frec. (Hz)')
ylabel('Amplitud')
axis([-1000 1000 0 1.1])

ydet3=ifft(fftshift(Ydef3)); %Cálculo de la transformada de Fourier inversa
ydet3=real(ydet3); %se utiliza para quitar los numeros complejos con una parte imaginaria pequeña que genera ifft

subplot(414)
plot(t,ydet3);
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
axis([0 0.1 -0.5 0.5])

%Para recuperar x2, hacemos un filtro de paso banda ideal combinando ambos
%Invertimos hdeflow y hdefhigh
fhigh = 320;

Hdefhigh_band = ones(1, L/2);
Hdefhigh_band(1:fhigh / fs*L) = zeros(1, fhigh / fs * L);
Hdefhigh_band = [fliplr(Hdefhigh_band) Hdefhigh_band];

flow = 500;

Hdeflow_band = zeros(1, L/2);
Hdeflow_band(1:flow / fs*L) = ones(1, flow / fs*L);
Hdeflow_band = [fliplr(Hdeflow_band) Hdeflow_band];

Hdefband = Hdeflow_band.*Hdefhigh_band;

figure;

subplot(411)
plot(f, abs(Xdef) / max(abs(Xdef))); %Dibujo del módulo de Xdef
axis([-1000 1000 0 1.1]); %Ajuste de los ejes de la figura
xlabel('Frec. (Hz)')
ylabel('Amplitud')
title('Seál de entrada en el dominio del tiempo')

subplot(412)
plot(f, abs(Hdefband));
axis([-1000 1000 0 1.1])

subplot(413)

Ydef2=Xdef.*Hdefband;
plot(f,abs(Ydef2)/max(abs(Ydef2)));
xlabel('Frec. (Hz)')
ylabel('Amplitud')
axis([-1000 1000 0 1.1])

ydet2=ifft(fftshift(Ydef2)); %Cálculo de la transformada de Fourier inversa
ydet2=real(ydet2); %se utiliza para quitar los numeros complejos con una parte imaginaria pequeña que genera ifft

subplot(414)
plot(t,ydet2);
xlabel('Tiempo(seg)') %Etiquetado del eje horizontal (tiempo)
ylabel('Amplitud') %Etiquetado del eje vertical
axis([0 0.1 -0.5 0.5])

