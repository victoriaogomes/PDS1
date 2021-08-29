%% Declaração da função
function [y1f, y1ff] = freqAndTimeResponse(t, inputSignal, figTitle)
    %% Transforma o sinal de entrada para o domínio da frequência
    y1f = fft(inputSignal);
    
    %% Multiplica o sinal no domínio da frequência pelo seu complexo conjugado
    y1ff = y1f .* conj(y1f); 
    
    %% Plotagem do gráfico comparando o sinal no domínio do tempo e da frequência
    figure('Name', figTitle);
    subplot(2, 1, 1);
    plot(t, inputSignal);
    title('Sinal no domínio do tempo');
    xlim([0 0.005]);
    xlabel('Tempo (em segundos)');
    grid on;
    subplot(2, 1, 2);
    plot(y1ff(1:end)/10e+7);
    title('Sinal no domínio da frequência');
    xlim([0 25000]);
    ylim([0 10]);
    xlabel('Frequência (em π rad/s)');
    ylabel('Magnitude');
    grid on;
end