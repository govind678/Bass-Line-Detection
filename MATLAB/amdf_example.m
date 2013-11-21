[y,Fs] = wavread('test.wav');

y = y(:, 1);

filesize = length(y);

blocksize = 2048;
hopsize = 1024;

hops = (filesize-blocksize)/hopsize-2;

period = zeros(hops, 1);
freq = zeros(hops, 1);
midi = zeros(hops, 1);

AMDF = zeros(blocksize-1,hops);

for i = 0 : hops - 1
    start = hopsize*i+1;
    endpoint = start+blocksize - 1;

    AMDF(:,i+1) = amdf(y(start : endpoint));
    
    [Val, period(i+1)] = min(AMDF(10:end,i+1));
    
    freq(i+1) = Fs/period(i+1);
    
    midi(i+1) = 69 + 12*log2(freq(i+1)/440);
end

plot(midi);
% imagesc(AMDF);