% function key = KeyDetect(audio)


%------------------------------------------------------------------------
% WARNING: This script takes waaayyy tooooo loooong to execute
%------------------------------------------------------------------------

tic

audio = 'Rolling.wav';

[x, Fs] = wavread(audio);

x = x(42*Fs:51.5*Fs,1);

disp(sprintf('Execution Time for Reading wav file: %f seconds',toc));


blockSize = 4096;
hopSize = 64;
Fc = 320;
mAvgBlock = 100;

nBins = blockSize/2 + 1;
binSize = Fs/blockSize;


[b,a] = butter(6,(2*Fc/Fs),'low');
[bh,ah] = butter(6,(2*32/Fs),'high');
input = filter(b,a,x);
input1 = filter(b,a,input);

stft = shortTermFT(input,Fs,blockSize,hopSize,1);

disp(sprintf('Execution Time for STFT: %f seconds',toc));



nBlocks = size(stft,2);
avgSTFT = zeros(nBins,nBlocks-mAvgBlock);


disp(sprintf('Warning: This will take some time, depending on block size. Its best you go chill for a while'));

for k=1:nBins
    avgSTFT(k,:) = movingAverage(stft(k,:),mAvgBlock);
end

disp(sprintf('Execution Time for LPF of STFT: %f seconds',toc));

[mVal,Ind] = max(stft);



% v = Chroma(x(1:200000), Fs);

% plot(sum(v, 2), 'o')





figure(1);
% hold on
Freq = 0:binSize:2*Fc;
% Time = 0:(hopSize*(1/Fs)):(nSamples*(1/Fs))-(hopSize*(1/Fs));
Time = 1:(nBlocks-mAvgBlock);
imagesc(Time,Freq,20*log10(stft(1:ceil(2*Fc/binSize),:)))
% imagesc(20*log10(avgSTFT(1:ceil(Fc/binSize))))
axis xy;view(0,90);
% plot(Ind*binSize,'*');
xlabel('Time');
ylabel('Frequency (Hz)');