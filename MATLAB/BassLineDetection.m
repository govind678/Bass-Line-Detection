% Bass Line Detection

blockSize = 4096;
hopSize = 1024;
fmin = 32.703;
fmax = 246.941;
binsPerOctave = 24;

nBins = blockSize/2 + 1;


% Read Input Audio File
[y,Fs] = wavread('Rolling.wav');
y = y(42*Fs:52*Fs,1);

binWidth = Fs/blockSize;


% Bandpass signal
w1 = 2*(fmin/(fs/2)); 
w2 = 0.8*(fmax/(fs/2));
[b,a] = butter(6,[w1 w2]);
sig = filtfilt(b,a,y);

% STFT of signal
stft = shortTermFT(sig,Fs,blockSize,hopSize,0);
constanQ = cqt(sig,fmin,fmax,binsPerOctave,Fs);





% % Calculating STFT
% stft = zeros(nBins,nBlocks);
% count = 1;
% for i=1:hopSize:nSamples-blockSize
%     tempDFT = fft(input(i:(i+blockSize-1)).*hamming(blockSize),blockSize);
%     stft(:,count) = tempDFT(1:nBins);
%     count = count+1;
% end






