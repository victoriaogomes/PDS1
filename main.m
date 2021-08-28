%% Frequência de passagem (fp) em hertz
fp = 500;

%% Máxima amplificação dos componentes do sinal (em dB)
Amax = 1;

%% Mínima amplificação dos componentes do sinal (em dB)
Amin = 20;

%% Ordem do filtro (N)
N = 1;

%% Chamada a função que cria o filtro e retorna o numerador e o denominador
% da sua função de transferência, bem como a sua frequência de rejeição
[num, denom, fs] = butterworthFilter(fp, Amax, Amin, N);
%% Realização da transformada de Fourier
% da sua função de transferência, bem como a sua frequência de rejeição

out = sim('LPFSimulation');
teste = out.answer.data;
L = numel(teste);
Fvrs = linspace(0, 1000, fix(L/2)+1)*pi; 
fts = fft(teste)/L;

Iv = 1:numel(Fvrs);  
figure(2)
semilogx(Fvrs, abs(fts(Iv))*2)
grid
xlabel('Frequency (rad/s)')
ylabel('Amplitude')
title('Frequency Domain Plot')