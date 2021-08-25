%% Parâmetros da função:
% Vetor com o eixo do tempo (eixo x)
% Frequência de passagem (fp) em hertz
% Máxima amplificação dos componentes do sinal (em dB)
% Mínima amplificação dos componentes do sinal (em dB)
% Ordem do filtro (N)
%% Declaração da função
function [num, denom, fs] = butterworthFilter(fp, Amax, Amin, N)
%% PASSO 01: Faremos os cálculos usando Ωp como 1
% omega_p = 1;  % Frequência de passagem normalizada (em rad/s)

%% PASSO 02: Cálculo do Ωs com base na ordem do filtro e nos demais dados 
num = (10^(Amin/10))-1;
denom = (10^(Amax/10))-1;
omega_s = ceil((num/denom)^(1/(2*N)));

%% PASSO 03: Cálculo do fs com base em Ωs e fp
fs = omega_s * fp;

%% PASSO 04: Obtenção dos pólos estáveis (assumindo Ωc = 1)
% sk = e ^ i * (π + 2πk / 2*N) + (π/2)
% Como N = 1, só temos k = 0, e: s0 = e ^ i * (π/2) + (π/2) = e^(i*π)
s0 = exp(1i*pi);

%% PASSO 05: Montagem da função de transferência
% Hs = tf(1, [1, -s0]);

%% PASSO 06: Reescalonamento os pólos
mult = (omega_s^(2*N))*(10^(Amax/10)-1);
Amin2 = 10*log10(mult);

%% PASSO 07: Cálculo do novo Ωc
omega_c = omega_s/(((10^(Amin2/10))-1)^(1/(2*N)));

%% PASSO 08: Determinação da nova função de transferência
% s -> s/2*π*fp
% Hsnovo = tf((omega_c^(N)), [1, -(s0*omega_c)]);

%% PASSO 09: Conversão do filtro passa-baixas normalizada usando a transformação de frequência
Hs = tf(((omega_c*2*pi*fp)^(N)), [1, -(s0*omega_c*2*pi*fp)]);

%% PASSO 10: Resposta ao impulso do filtro passa-baixas criado
% Frequência começa em 0, com marcações são separadas a cada (2*pi*fs)/100, e
% termina em 2*pi*fs
num = Hs.Numerator{:};
denom = Hs.Denominator{:};
w = 0 : (2*pi*fs)/100 : 2*pi*fs;
freqs(num, denom, w)
end