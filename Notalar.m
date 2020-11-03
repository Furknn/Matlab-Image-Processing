FreqDo=261.63;
FreqRe=293.66;
FreqMi=329.63;
FreqFa=349.23;
FreqSol=392.00;
FreqLa=440;
FreqSi=493.88;
fs=10000;
t=0:1/fs:0.5;
randArr=randi([1 7],100,1);
Ses=[];
for i=1:100
a=randArr(i);
switch a
case 1
nota=sin(2*pi*FreqDo*t);
Ses=[Ses nota];
case 2
nota=sin(2*pi*FreqRe*t);
Ses=[Ses nota];
case 3
nota=sin(2*pi*FreqMi*t);
Ses=[Ses nota];
case 4
nota=sin(2*pi*FreqFa*t);
Ses=[Ses nota];
case 5
nota=sin(2*pi*FreqSol*t);
Ses=[Ses nota];
case 6
nota=sin(2*pi*FreqLa*t);
Ses=[Ses nota];
case 7
nota=sin(2*pi*FreqSi*t);
Ses=[Ses nota];
end
end
audiowrite('ses.wav',Ses,fs);
sound(Ses,fs);