clear all;
close all;
clc;

% Bass Line Detection

[x,Fs] = wavread('Adele.wav');
x = x(:,1);

% note_matrix = readmidi_java('Nirvana.mid');

% Low Pass Filter
Fc = 240;
[b,a] = butter(8,2*pi*(Fc/Fs),'low');

input = filter(b,a,x((38*Fs):(46*Fs)));
key = KeyDetect(input, Fs);