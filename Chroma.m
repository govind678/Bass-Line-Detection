function v = Chroma(x1, Fs1)


blockSize = 4096;
hopSize = 2048;

nSamples = length(x1);
n=1;
nyquist = floor(blockSize/2)+1;
S = zeros(nyquist,floor(nSamples/hopSize));
count = 1;

pitches = [220
233.08
246.94
261.63
277.18
293.66
311.13
329.63
349.23
369.99
392
415.3];

limits = [pitches*2^(-1/24) pitches pitches*2^(1/24)];

bins = 0:Fs1/(nyquist-1):Fs1/2;

filter = zeros(12, nyquist);

v = zeros(12, floor(nSamples/hopSize));

for i = 1:12
    idx = find((bins > limits(i, 1)) & (bins < limits(i, 3)));
    filter(i, idx) = 1/length(idx);
    
    idx = find((bins > 2*limits(i, 1)) & (bins < 2*limits(i, 3)));
    filter(i, idx) = 1/length(idx);
    
    idx = find((bins > 4*limits(i, 1)) & (bins < 4*limits(i, 3)));
    filter(i, idx) = 1/length(idx);
    
    idx = find((bins > 8*limits(i, 1)) & (bins < 8*limits(i, 3)));
    filter(i, idx) = 1/length(idx);    
end

while n <= nSamples-blockSize
    x1_fft = fft(x1(n:(n+blockSize-1)),blockSize);
    S(:,count) = x1_fft(1:nyquist);
    
    for i = 1:12
        v(i,count) = sum((abs(S(:,count).^2)/blockSize).*filter(i,:)');
    end
    
    denom = sqrt(sum(v(:, count).^2)/12);
    
    v(:, count) = v(:, count)/denom;
    
    n = n + hopSize;
    count=count+1;
end

figure;
imagesc(v);

end


               
            

