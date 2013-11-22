function hps_example(y, Fs)

% [y,Fs] = wavread(filename);

filesize = length(y);
blocksize = 8192;
hopsize = 512;

hops = floor((filesize-blocksize)/hopsize - 1);

freq = zeros(hops, 1);
midi = zeros(hops, 1);

y_fft = abs(shortTermFT(y,Fs,blocksize,hopsize,1));

start_index = 1;

for i = 1 : hops
    
    HPS(:,i) = hps(y_fft(:,i));
    
    freq(i) = find(HPS(:,i) == max(HPS(1:50,i)))*Fs/blocksize;
    
    midi(i) = 69 + 12*log2(freq(i)/440);
    
    start_index = start_index + 1;
    
end

figure;
plot(midi);

