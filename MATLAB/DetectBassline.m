function tabs = DetectBassline(au, Fs)


%% Read file
[x,Fs] = wavread(wav);
x = x(:,1);

%% Low Pass Filter
Fc = 240;

[b,a] = butter(8,2*(Fc/Fs),'low');

input = filter(b,a,x);

%% Average Mean Difference Function
amdf_out = amdf_example(input, Fs);
figure;
plot(medfilt1(amdf_out, 40))

%% Harmonic Product Spectrum
hps_out = hps_example(input, Fs);
figure;
plot(medfilt1(hps_out, 40))

%% AMDF Weighted ACF
amdf_w_acf_out = amdf_w_acf_example(input, Fs)
figure;
plot(medfilt1(amdf_w_acf_out, 40));

end