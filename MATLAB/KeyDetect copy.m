function scores = KeyDetect(x, Fs)

v = sum(Chroma(x, Fs), 2);

figure;
plot(v, 'o');

% Major = [1 0 1 0 1 1 0 1 0 1 0 1];
% Minor = [1 0 1 1 0 1 0 1 1 0 1 0];

Major = [0.49483 0.17377 0.27118 0.18157 0.34131 0.31872 0.19637 0.40443 0.18624 0.28521 0.17845 0.22443];

scores = zeros(24, 1);

count = 1;

for i = 1:12
    
    scores(count) = sum(circshift(Major, [1 i]).*v');
    scores(count+1) = sum(circshift(Major, [1 i]).*v');
    
    count = count + 2;
end

[Val, key] = max(scores);

end