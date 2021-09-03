%% Sinal de entrada e sua exibição no domínio do tempo e da frequência
fmax = 3000;
fmin = 10;
fs = 10 * 1000;
[xt,fc,phi,t] = sinal(2, ...   % Duração do sinal (em segundos)
    fmin, ...                  % Componente de frequência mínimo em Hz
    fmax);                     % Componente de frequência máximo em Hz
signal = timetable(seconds(t'), xt');
% f_max = (2*7500);
% f_nyquist = 2*f_max;
% t = 0 : 2/(2*f_nyquist) : 2;
% x = sin(2*1000*pi*t) + sin(2*5000*pi*t) + sin(2*7500*pi*t);
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
Mdpuro = fs/(3 * (1000));
% - Mu*(Fs/Md) < 5000
Mu = floor((5000*Md)/fs);

%% Construção do filtro
[num, denom, omega_c] = butterworthFilter(fp, Amax, Amin, N);

%% Filtragem do sinal e exibição do resultado
% [filteredSignal, t_filt] = lsim(tf(num, denom), inputSignal, t);
% freqAndTimeResponse(t_filt, filteredSignal, 'Sinal filtrado');

%% Trem de impulsos
% [impTrain] = impulseTrain(f_nyquist, f_max, size(t_filt));
% freqAndTimeResponse(t_filt, impTrain, strcat('Trem de impulsos'));
% newSignal = filteredSignal .* impTrain;
% freqAndTimeResponse(t, newSignal, 'Sinal multiplicado pelo trem de impulsos');


%% Tentativa 2 milhões
% s = tf('s');
% Ts = 1/(f_nyquist);
% sys = (1-exp(-s*Ts))/s;
% bode(sys);
% [zohSignal, t_zoh] = lsim(sys, newSignal, t);
% freqAndTimeResponse(t_zoh, zohSignal, 'Sinal após o zoh');