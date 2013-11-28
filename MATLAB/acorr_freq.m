
%% 1.e Own autocorrelation in frequency-domain

function result = acorr_freq(block)

N = length(block);

result = ifft( fft(block) .* conj(fft(block)) );

result = [result(end-N+2:end) result(1:N)];

end