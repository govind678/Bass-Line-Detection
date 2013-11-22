clear all;
close all;
clc;

% Bass Line Detection

[x,Fs] = wavread('AdeleBass.wav');
x = x(:,1);

% note_matrix = readmidi_java('Nirvana.mid');

% Low Pass Filter
Fc = 240;
[b,a] = butter(8,2*(Fc/Fs),'low');

input = filter(b,a,x((42*Fs):(51*Fs)));

amdf_example(input, Fs);

hps_example(input, Fs);
% bins_per_octave = 24;
% fmax = Fs/2;     %center frequency of the highest frequency bin 
% fmin = fmax/512; %lower boundary for CQT (lowest frequency bin will be immediately above this): fmax/<power of two> 
% 
% Xcqt = cqt(input,fmin,fmax,bins_per_octave,Fs);
% 
% plotCQT(Xcqt,Fs,0.6,'surf');


% nSamples = length(input);
% blockSize = 2048;
% hopSize = 1024;
% nBins = blockSize/2 + 1;
% nBlocks = floor(nSamples/hopSize);
% binWidth = Fs/blockSize;
% 
% 
% 
% stft = zeros(nBins,nBlocks);
% count = 1;
% for i=1:hopSize:nSamples-blockSize
%     tempDFT = fft(input(i:(i+blockSize-1)).*hamming(blockSize),blockSize);
%     stft(:,count) = tempDFT(1:nBins);
%     count = count+1;
% end

% Autocorrelation

