%Paso 3


fs = 48000 % Frecuencia de muestreo utilizada en el DVD en Hz.
Ts = 1 / fs; %Periodo de muestreo: inverso de la frec. muestreo en Hz
T = 1; %Duración de la señal en segundos
A = 0.1; %Amplitud de la señal senoidal

flow=100; %Frecuencia de corte (Hz) del filtro paso bajo
t = Ts:Ts:T; %Vector eje tiempo
L = length(t); %Longitud del vector t. Comprobar que sea igual a fs*T
f = -fs / 2 + fs / L:fs / L:fs / 2; %Declaración del eje de frecuencias
Hdeflow = zeros(1, L/2);
Hdeflow(1:flow / fs*L) = ones(1, flow / fs*L);
Hdeflow = [fliplr(Hdeflow) Hdeflow];

figure;

plot(f, abs(Hdeflow));
axis([-1000 1000 0 1.1])