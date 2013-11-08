% function key = KeyDetect(audio)

audio = 'Project/Bass-Line-Detection/AdeleBassLess.wav';

[x, Fs] = wavread(audio);

v = Chroma(x(1:200000), Fs);

plot(sum(v, 2), 'o')
