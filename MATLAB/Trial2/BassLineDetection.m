% Bass Line

audio = '../../Audio/Rolling.wav';

[x, Fs] = wavread(audio);
x = x(42*Fs:51.5*Fs,1);
nSamples = length(x);


Fc = 320;
[bl,al] = butter(2,2*Fc/Fs,'low');
y = filter(bl,al,x);


blockSize = 2048;
hopSize = 256;


stft = shortTermFT(y,Fs,blockSize,hopSize,1);

instantFreq = instantaneousFrequency(stft,Fs);


figure();
Freq = 0:Fs/blockSize:Fs/2;
Time = 1:nSamples;
imagesc(Time,Freq,20*log10(abs(instantFreq)))
axis xy;view(0,90);
xlabel('Time');
ylabel('Frequency (Hz)');