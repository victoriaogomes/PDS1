%Out S: Sinal no dominio da frequencia
%Out frequency: será a frequencia do sinal
%Param s: sinal
%Param fs: frequencia de amostragem
function [S,frequency] = my_fft(s,fs)
normal = length(s);
aux = 0: normal -1;
T = normal/fs;
frequency = aux/T;
S = fftn(s)/normal; %transformada de fourier
fc = ceil(normal/2);
S = S(1:fc);
figure();
plot(frequency(1:fc),abs(S));
title("Analise de espectro");
xlabel("Frequencia(HZ)");
ylabel("Amplitude");
end

