function [ output_args ] = movingAverage( X, blockSize )
% movingAverage
%   Compute the moving average of a signal x

nSamples = length(X);

mAvg = [];
for n = 1:(nSamples-blockSize)
    tempAvg = mean(X(n:n+blockSize));
    mAvg = [mAvg; tempAvg]; 
end

output_args = mAvg;
end

