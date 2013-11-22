%% HPS

function result = hps(block)

N = length(block);

Order = 4;

result = block;

for i = 2 : Order
    result = result(1:length(block(1:i:N))).*block(1:i:N);
end

end
    