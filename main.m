%% Sinal de entrada
f_nyquist = 2*(2*7500);
t = 0 : 2/(2*f_nyquist) : 2;
inputSignal = sin(2*1000*pi*t) + sin(2*5000*pi*t) + sin(2*7500*pi*t);

%% Exibição do sinal de entrada no domínio do tempo e da frequência
[y1f, y1ff] = freqAndTimeResponse(t, inputSignal, 'Sinal de entrada', 1);

%% Dados para a construção do filtro
fp = 509;          % Frequência de passagem (fp) em hertz
Amax = 1;          % Máxima amplificação dos componentes do sinal (em dB)
Amin = 20;         % Mínima amplificação dos componentes do sinal (em dB)
N = 1;             % Ordem do filtro (N)

%% Chamada a função que cria o filtro
[num, denom, fs, omega_c] = butterworthFilter(fp, Amax, Amin, N);
output_data = lsim(tf(num, denom), inputSignal, t);
freqAndTimeResponse(t, output_data, 'Sinal filtrado', 3);
