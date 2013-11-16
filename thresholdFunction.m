function [ output_args ] = thresholdFunction( detectionFunciton, delta, lambda, window )

deltaF = delta*(ones(length(detectionFunciton),1));
for i=window:length(detectionFunciton)-window
    deltaF(i) = delta + lambda*mean(abs(detectionFunciton(i-window+1:i+window)));
end

onsets = zeros(length(detectionFunciton),1);
count = 1;
while count<length(detectionFunciton)
    if detectionFunciton(count) > deltaF(count)
        onsets(count) = 1;
        count = count + window;
    else
        count = count + 1;
    end
end

output_args = onsets;

end

