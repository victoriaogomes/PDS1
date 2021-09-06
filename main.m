close all;
clear all;
%% Sinal de entrada e sua exibição no domínio do tempo e da frequência
fmax = 3000;
fmin = 10;
fs = 10 * 1000;
[xt,fc,phi,t] = sinal(2, ...   % Duração do sinal (em segundos)
    fmin, ...                  % Componente de frequência mínimo em Hz
    fmax);                     % Componente de frequência máximo em Hz
signal = timetable(seconds(t'), xt');
%% Dados para a construção do filtro
fp = 509;                      % Frequência de passagem (fp) em hertz
Amax = 1;                      % Máxima amplificação dos componentes do sinal (em dB)
Amin = 20;                     % Mínima amplificação dos componentes do sinal (em dB)
N = 1;                         % Ordem do filtro (N)


%% Cálculo do fator de Downsample(Md) e Upsample (Mu)
%Fs = ;
%f_max = ;
% - Fs/Md > 2*F_max -> Fs/(2*F_max) > Md  (Verificar os valores para que
% seja maior que a taxa desejada realmente)
Md = ceil(fs/(3 * (1000)));
% - Mu*(Fs/Md) < 5000
Mu = floor((5000*Md)/fs);
if Mu == 0
    Mu = 1;
end
teste = (1/((fs/Md)*Mu));
%% Construção do filtro
[num, denom, omega_c] = butterworthFilter(fp, Amax, Amin, N);
