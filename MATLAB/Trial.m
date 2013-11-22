
[x,Fs] = wavread('Rolling.wav');
x = x(30*Fs:40*Fs,1);

% note_matrix = readmidi_java('Nirvana.mid');

Fc = 320;
[b,a] = butter(8,2*pi*(Fc/Fs),'low');

% input = filter(b,a,x((25*Fs):(32*Fs)));

% pitch = yinDAFX(input,Fs,2,256);