%% Frequência de passagem (fp) em hertz
fp = 1000;

%% Máxima amplificação dos componentes do sinal (em dB)
Amax = 1;

%% Mínima amplificação dos componentes do sinal (em dB)
Amin = 20;

%% Ordem do filtro (N)
N = 1;

%% Chamada a função que cria o filtro e retorna o numerador e o denominador
% da sua função de transferência, bem como a sua frequência de rejeição
[num, denom, fs] = butterworthFilter(10*fp, Amax, Amin, N);