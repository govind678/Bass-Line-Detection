[x, fs] = wavread('../Audio/Beatles.wav');
x = x(Fs*32.5:Fs*35);
Fc = 240;
[b,a] = butter(8,2*(Fc/Fs),'low');
x1 = x;
input1 = filter(b,a,x1);

x2 = input1(1:2:end);
input2 = filter(b,a,x2);


x3 = input2(1:2:end);
input3 = filter(b,a,x3);


x4 = input3(1:2:end);
input4 = filter(b,a,x4);