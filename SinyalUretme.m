fs=5000;
f=100;
t=0:1/fs:5;
signal=sin(2*pi*f*t);
%sound(signal,fs)
sound(signal,44100)
plot(t,signal)
%ilk 100 örnek
stem(t,signal)
axis([0 0.0002*100 -1 1])