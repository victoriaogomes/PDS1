function [y, t] = impulseTrain(sampleFreq, signalFreq)
%% trem de impulso
t=0:1/sampleFreq:1; 
y=zeros(size(t));
y(1:sampleFreq/signalFreq:end)=1;
% figure('Name', 'Trem de impulsos');
% plot(t,y);
% xlim([0 0.001]);
end

