function [ output_args ] = frequencyWeighting( X, Fs, Fc, plot )

nyquist = size(X,1);
nBlocks = size(X,2);

binSize = Fs / (2*nyquist);

FcBin = 1 + floor(Fc/binSize);

stft = abs(X(1:FcBin,:));

weightFreq = zeros(size(stft));

weightFreq(FcBin,:) = FcBin*binSize;

for t = 1:nBlocks
 
    spec = stft(:,t);
    
    for k = 2:FcBin-1
        x(1) = ((k-1)*binSize) - binSize;
        x(2) = (k*binSize) - binSize;
        x(3) = ((k+1)*binSize) - binSize;

        w(1) = spec(k-1);
        w(2) = spec(k);
        w(3) = spec(k+1);
        
        if (sum(w) ~= 0)
            weightFreq(k,t) = ((w(1)*x(1)) + (w(2)*x(2)) + (w(3)*x(3))) / sum(w);
        else
            weightFreq(k,t) = 0;
        end
    end
    
end


if plot == 1
    time = 1:nBlocks;
    figure();
    xlabel('Time');
    ylabel('Frequency');
    zlabel('Amplitude');
    mesh(time,weightFreq,X);
end

output_args = weightFreq;

end

