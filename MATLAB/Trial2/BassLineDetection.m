% % Bass Line
% 
audio = '../../Audio/Getlucky.wav';

[x, Fs] = wavread(audio);
x = x(1:8*Fs,1);
nSamples = length(x);


FcL = 320;
FcH = 32;
[bl,al] = butter(2,2*FcL/Fs,'low');
[bh,ah] = butter(2,2*FcH/Fs,'high');

z = filter(bl,al,x);
y = filter(bh,ah,z);

[b,a] = butter(2,0.9999999999,'low');


blockSize = 2048;
hopSize = 256;
nyq = blockSize/2 + 1;

 




% Multirate Processing

stft0 = shortTermFT(y,Fs,blockSize,hopSize,1);
% inst0 = instantaneousFrequency(stft0,Fs,0);
weight0 = frequencyWeighting(stft0,Fs,FcL,0);
binSize0 = Fs / (2*nyq);
FcBin0 = 1 + floor(FcL/binSize0);
stftFreqs0 = ((1:FcBin0)'.* binSize0) - binSize0;


Fs1 = floor(Fs/(2^1));
x1 = y(1:2:end);
y1 = filter(b,a,x1);
stft1 = shortTermFT(y1,Fs1,blockSize,hopSize,1);
% inst1 = instantaneousFrequency(stft1,floor(Fs/(2^1)),0);
weight1 = frequencyWeighting(stft1,Fs1,FcL,0);
binSize1 = Fs1 / (2*nyq);
FcBin1 = 1 + floor(FcL/binSize1);
stftFreqs1 = ((1:FcBin1)'.* binSize1) - binSize1;


Fs2 = floor(Fs/(2^2));
x2 = y1(1:2:end);
y2 = filter(b,a,x2);
stft2 = shortTermFT(y2,Fs2,blockSize,hopSize,1);
% inst2 = instantaneousFrequency(stft1,floor(Fs/(2^2)),0);
weight2 = frequencyWeighting(stft2,Fs2,FcL,0);
binSize2 = Fs2 / (2*nyq);
FcBin2 = 1 + floor(FcL/binSize2);
stftFreqs2 = ((1:FcBin2)'.* binSize2) - binSize2;


Fs3 = floor(Fs/(2^3));
x3 = y2(1:2:end);
y3 = filter(b,a,x3);
stft3 = shortTermFT(y3,Fs3,blockSize,hopSize,1);
% inst3 = instantaneousFrequency(stft1,floor(Fs/(2^3)),0);
weight3 = frequencyWeighting(stft3,Fs3,FcL,0);
binSize3 = Fs3 / (2*nyq);
FcBin3 = 1 + floor(FcL/binSize3);
stftFreqs3 = ((1:FcBin3)'.* binSize3) - binSize3;





% stft = shortTermFT(y,Fs,blockSize,hopSize,0);
% nBlocks = size(stft,2);






% figure();
% Freq = 0:binSize:FcBin*binSize;
% Time = 1:nBlocks;
% imagesc(Time,weightFreq,(20*log10(stft)))
% axis xy;view(0,90);
% xlabel('Time');
% yTitle = sprintf('Frequency (Hz), Fs: %d',Fs);
% ylabel(yTitle);

