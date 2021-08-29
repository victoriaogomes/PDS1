%% Sinal de entrada e sua exibição no domínio do tempo e da frequência
f_max = (2*7500);
f_nyquist = 2*f_max;
t = 0 : 2/(2*f_nyquist) : 2;
inputSignal = sin(2*1000*pi*t) + sin(2*5000*pi*t) + sin(2*7500*pi*t);
%freqAndTimeResponse(t, inputSignal, 'Sinal de entrada');

%% Dados para a construção do filtro
fp = 509;          % Frequência de passagem (fp) em hertz
Amax = 1;          % Máxima amplificação dos componentes do sinal (em dB)
Amin = 20;         % Mínima amplificação dos componentes do sinal (em dB)
N = 1;             % Ordem do filtro (N)

%% Construção do filtro
[num, denom, fsample, omega_c] = butterworthFilter(fp, Amax, Amin, N);

%% Filtragem do sinal e exibição do resultado
[filteredSignal, t_filt] = lsim(tf(num, denom), inputSignal, t);
freqAndTimeResponse(t_filt, filteredSignal, 'Sinal filtrado');

%% Trem de impulsos
[impTrain] = impulseTrain(f_nyquist, f_max, size(t_filt));
freqAndTimeResponse(t_filt, impTrain, strcat('Trem de impulsos'));
newSignal = filteredSignal .* impTrain;
freqAndTimeResponse(t, newSignal, 'Sinal multiplicado pelo trem de impulsos');

%% Sample and holder
%ups = 4;

%fu = fs*ups;
%tu = 0:1/fu:1-1/fu;

%y = downsample(filteredSignal,ups);

% stem(tu,y,'--x')
%figure(10);
%plot(y);
%hold on
%stairs(t,filteredSignal)
%hold off