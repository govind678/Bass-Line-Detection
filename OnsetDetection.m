% Onset Detection on Bassline

blockSize = 4096;
hopSize = 512;

Fc = 247;

[y,Fs] = wavread('Rolling.wav');
y = y(42*Fs:51*Fs,1);


[b,a] = butter(8,2*pi*(Fc/Fs),'low');
filt1 = filter(b,a,y);

filt2 = filter(b,a,filt1);

% fmin = 60;
% fmax = 240;
% bins = 12;
% 
% %stft = cqt(y,fmin,fmax,bins,Fs);
stft = shortTermFT(filt2,Fs,blockSize,hopSize,0);
nSamples = length(y);


kLPF = 0.1;
detect = detectionFunction(stft,blockSize,kLPF);

delta = 0.1;
lambda = 0.85;
window = ceil((230/1000) * (Fs/hopSize));      % 80 ms window

onsetsK = thresholdFunction(detect,delta,lambda,window);


% Zero Crossing Rate

% zcr = zeros(size(stft,2),1);
% index = 1;
% for n=1:hopSize:nSamples-blockSize
%     zcSum = 0;
%     for i=n+1:n+blockSize
%         sig = abs(sign(y(i))-sign(y(i-1)));
%         zcSum = zcSum + sig;
%     end
%     zcr(index) = zcSum/(2*blockSize);
%     index = index+1;
% end




% figure(1);
% hold on
% plot(detect,'b');
% stem(onsetsK,'r');