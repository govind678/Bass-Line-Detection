clear all;
close all;
clc;

% Bass Line Detection

[x,Fs] = wavread('../Audio/Rolling.wav');
x = x(:,1);

% note_matrix = readmidi_java('Nirvana.mid');

% Low Pass Filter
Fc = 240;
[b,a] = butter(4,2*(Fc/Fs),'low'); 

input = filter(b,a,x((42*Fs):(51*Fs)));

out = amdf_w_acf_example(input, Fs);

% hps_example(input, Fs);

% bins_per_octave = 24;
% fmax = Fs/2;     %center frequency of the highest frequency bin 
% fmin = fmax/512; %lower boundary for CQT (lowest frequency bin will be immediately above this): fmax/<power of two> 
% 
% Xcqt = cqt(input,fmin,fmax,bins_per_octave,Fs);
% 
% plotCQT(Xcqt,Fs,0.6,'surf');


% nSamples = length(input);
% blockSize = 8192;
% hopSize = 64;
% nBins = blockSize/2 + 1;
% nBlocks = floor(nSamples/hopSize);
% binWidth = Fs/blockSize;
% 
% stft = zeros(nBins,nBlocks);
% count = 1;
% for i=1:hopSize:nSamples-blockSize
%     tempDFT = fft(input(i:(i+blockSize-1)).*hamming(blockSize),blockSize);
%     stft(:,count) = abs(tempDFT(1:nBins));
%     count = count+1;
% end

% Autocorrelation of the Y-axis of STFT

% acf = zeros(2*nBins - 1, nBlocks);
% 
% for i = 1 : nBlocks
%     acf(:, i) = xcorr(stft(:,i));
% end
% 
% Freq = 0:Fs/blockSize:Fs/2;
% Time = 0:(hopSize*(1/Fs)):(nSamples*(1/Fs))-(hopSize*(1/Fs));
% imagesc(Time,Freq,20*log10((stft)))
% axis xy;view(0,90);
% xlabel('Time');
% ylabel('Frequency');

% Freq = 0:Fs/blockSize:Fs/2;
% Time = 0:(hopSize*(1/Fs)):(nSamples*(1/Fs))-(hopSize*(1/Fs));
% imagesc(Time,Freq,20*log10((stft)))
% axis xy;view(0,90);
% xlabel('Time');
% ylabel('Frequency');
% 
% hold on
% 
% plot(Time, max(stft), 'bo');

