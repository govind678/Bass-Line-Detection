function [ output_args ] = instantaneousFrequency( X, Fs, plot )

blockSize = (size(X,1) - 1) * 2;

realSTFT = abs(X);
imgSTFT  = unwrap(angle(X));

nBins = size(X,1);
nBlocks = size(X,2);

instantFreq = zeros(nBins,nBlocks);

for t = 2:nBlocks
    for w = 1:nBins
        
        a = realSTFT(w,t);
        b = imgSTFT(w,t);
        aD = realSTFT(w,t-1);
        bD = imgSTFT(w,t-1);
        
        instantFreq(w,t) = w + ( (a * (b - bD)) - (b * (a - aD)) / (a^2 + b^2) );
    end
end


if plot == 1
    figure();
    Freq = 0:Fs/blockSize:Fs/2;
    Time = 1:nBlocks;
    imagesc(Time,Freq,20*log10(abs(instantFreq)))
    axis xy;view(0,90);
    xlabel('Time');
    yTitle = sprintf('Frequency (Hz), Fs: %d',Fs);
    ylabel(yTitle);
end


output_args = instantFreq;

end

