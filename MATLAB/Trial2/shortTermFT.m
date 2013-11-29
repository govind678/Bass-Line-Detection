function [ output_args ] = shortTermFT( X, Fs, blockSize, hopSize, plot )

nSamples = length(X);
n=1;
nyquist = floor(blockSize/2)+1;
S = zeros(nyquist,floor(nSamples/hopSize));
count = 1;
while n <= nSamples-blockSize
%     dft = fft(X(n:(n+blockSize-1)),blockSize); %without window     
    dft = fft(X(n:(n+blockSize-1)).*hamming(blockSize),blockSize); %with window function
    S(:,count) = dft(1:nyquist);
    n = n + hopSize;
    count=count+1;
end

if(plot == 1)
    figure();
    Freq = 0:Fs/blockSize:Fs/2;
%     Time = 0:(hopSize*(1/Fs)):(nSamples*(1/Fs))-(hopSize*(1/Fs));
    Time = 1:nSamples;
%     imagesc(Time,Freq,(abs(S).^2))
    imagesc(Time,Freq,(20*log10(abs(S))))
    axis xy;view(0,90);
    xlabel('Time');
    ylabel('Frequency (Hz)');
end

output_args = S;

end


