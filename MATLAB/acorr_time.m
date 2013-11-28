%% 1.d Own autocorrelation in time-domain

function result = acorr_time(block)

N = size(block,2);

result = zeros(2*N-1,1);

temp = [block zeros(1,N-1)];

for i = 1:2*N-1
    result(i) = sum(temp(i:i+N-1).*block(1:N));
end

end