function [ spFlux ] = spectralFlux( X, blockSize )

nBlocks = size(X,2);
nBins = size(X,1);

flux = zeros(nBlocks,1);

for n=2:nBlocks
    tempSum = 0;
    for k=1:nBins
        temp = (abs(X(k,n)) - abs(X(k,n-1))) ^ 2;
        tempSum = tempSum + temp;
    end
    flux(n) = (2*sqrt(tempSum))/blockSize;
end

spFlux = flux;

end

