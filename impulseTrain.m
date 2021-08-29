function [y] = impulseTrain(sampleFreq, signalFreq, size_t)
%% trem de impulso
y=zeros(size_t);
% display(sampleFreq/signalFreq)
y(1:sampleFreq/signalFreq:end)=1;
% figure('Name', 'Trem de impulsos');
% plot(t,y);
% xlim([0 0.001]);
end

