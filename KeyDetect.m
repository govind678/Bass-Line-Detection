% function key = KeyDetect(audio)

audio = 'Rolling.wav';

[x, Fs] = wavread(audio);

x = x(42*Fs:51.5*Fs,1);

blockSize = 4096;
hopSize = 64;
Fc = 320;
mAvgBlock = 100;

nBins = blockSize/2 + 1;
binSize = Fs/blockSize;


[b,a] = butter(6,(2*Fc/Fs),'low');
input = filter(b,a,x);

stft = shortTermFT(input,Fs,blockSize,hopSize,0);

nBlocks = size(stft,2);
avgSTFT = zeros(nBins,nBlocks-mAvgBlock);


for k=1:nBins
    avgSTFT(k,:) = movingAverage(stft(k,:),mAvgBlock);
end


% v = Chroma(x(1:200000), Fs);


% plot(sum(v, 2), 'o')

figure(1);
Freq = 0:binSize:2*Fc;
% Time = 0:(hopSize*(1/Fs)):(nSamples*(1/Fs))-(hopSize*(1/Fs));
Time = 1:(nBlocks-mAvgBlock);
imagesc(Time,Freq,20*log10(avgSTFT(1:ceil(2*Fc/binSize),:)))
% imagesc(20*log10(avgSTFT(1:ceil(Fc/binSize))))
axis xy;view(0,90);
xlabel('Time');
ylabel('Frequency (Hz)');


