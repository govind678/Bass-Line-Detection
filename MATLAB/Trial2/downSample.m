function [ output_args ] = downSample( x, Fs, Fc, dec, blockSize, hopSize, plot )


cFs = floor(Fs/(2^dec));

x1 = x(1:2:end);

[b,a] = butter(2,0.9999999999,'low');
y = filter(b,a,x1);

tempSTFT = abs(shortTermFT(y,cFs,blockSize,hopSize,0));

stft = tempSTFT(



end

