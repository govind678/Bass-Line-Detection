function [ output_args ] = detectionFunction( X, blockSize, kLPF )

spFlux = spectralFlux(X,blockSize);

% Low Pass Filter
detect = zeros(length(spFlux),1);
for i=2:length(detect)
    detect(i) = kLPF*spFlux(i) + (1-kLPF)*detect(i-1);
end
output_args = detect / max(detect);


end

