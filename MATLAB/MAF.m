function filtered = MAF(signal, filter_length)

N = length(signal);
L = filter_length;

filtered = zeros(1, N-L);

for i = 1:N-(L-1)
    filtered(i) = mean(signal(i:i+(L-1)));
end

end