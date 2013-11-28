function output = mySTFT(audio, blockSize, hopSize, plot)

% [X, Fs] = wavread(audio);

Y = audio;

L = length(Y);

nHops = (L-blockSize)/hopSize;

startIndex = 1;

for i = 1:nHops
   output(:,i) = abs(fft(Y(startIndex:startIndex+blockSize-1)));
   startIndex = startIndex + hopSize;
end

if plot == 1
    t = 1:blockSize;
    f = 1:nHops;
    surf(f, t, output);
end