% Bass Line Detection


[x,Fs] = wavread('Nirvana.wav');
x = x(:,1);

note_matrix = readmidi_java('Nirvana.mid');



% Low Pass Filter
Fc = 320;
[b,a] = butter(8,2*pi*(Fc/Fs),'low');

input = filter(b,a,x((25*Fs):(32*Fs)));
nSamples = length(input);
blockSize = 2048;
hopSize = 1024;
nBins = blockSize/2 + 1;
nBlocks = floor(nSamples/hopSize);
binWidth = Fs/blockSize;



stft = zeros(nBins,nBlocks);
count = 1;
for i=1:hopSize:nSamples-blockSize
    tempDFT = fft(input(i:(i+blockSize-1)).*hamming(blockSize),blockSize);
    stft(:,count) = tempDFT(1:nBins);
    count = count+1;
end




% Autocorrelation

