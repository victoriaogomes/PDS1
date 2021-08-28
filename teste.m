clear all;

D = load('F072.txt');                                           % Column Vector
L = numel(D);                                                   % Signal Length
Fs = 80;                                                        % Sampling Frequency (Hz)
Fn = Fs/2;                                                      % Nyquist Frequency (Hz)
Ts = 1/Fs;                                                      % Sampling Interval (sec)
t = linspace(0, L, L)*Ts;                                       % Time Vector

figure(1)
plot(t, D);
grid on
xlabel('Time (sec)');
ylabel('Amplitude');
title('Time Domain Plot');

S = D - mean(D);                                                % Subtract D-C Offset
FTS = fft(S)/L;                                                 % Fourier Transform
Fvrs = linspace(0, 1, fix(L/2)+1)*pi;                           % Frequency Vector (rad/sec)
FvHz = linspace(0, 1, fix(L/2)+1)*Fn;                           % Frequency Vector (Hz)
Iv = 1:numel(Fvrs);                                             % Index Vector

figure(2)
plot(Fvrs, abs(FTS(Iv))*2)
grid
xlabel('Frequency (rad/s)')
ylabel('Amplitude')
title('Frequency Domain Plot')

figure(3)
semilogx(Fvrs, abs(FTS(Iv))*2)
grid
xlabel('Frequency (rad/s)')
ylabel('Amplitude')
title('Frequency Domain Plot')