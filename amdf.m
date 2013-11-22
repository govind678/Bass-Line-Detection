%% AMDF

function result = amdf(block)

N = length(block);

result = zeros(N-1,1);

temp = [block; zeros(N-1,1)];

for i = 1:N-1
    result(i) = sum(abs(temp(i:i+N-1) - block(1:N)))/N;
end

end