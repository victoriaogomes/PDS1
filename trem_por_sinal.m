close all
clear
clc

%% trem de impulso
f = 100 % Frequencia do sinal em Hz
fs = 20*f % Pegando uma frequencia de amostragem 10x maior
t=0:1/fs:1; 
y=zeros(size(t));
y(1:fs/f:end)=1;
subplot(4, 1, 1)
plot(t,y);
title('Trem de Impulsos');

%% Sinal

sinal = sin(20*pi*t);
subplot(4, 1, 2)
plot(t, sinal);
title('Sinal Seinodal');

%% Transformada de Fourier
yf = abs(fft(y));
sinalf = abs(fft(sinal));

subplot(4, 1, 3)
plot(sinalf);
title('Sinal Após a FFT');

%% Convolução

result = conv(yf, sinalf);
subplot(4, 1, 4)
plot(result);
title('Resultado da Convolucao');