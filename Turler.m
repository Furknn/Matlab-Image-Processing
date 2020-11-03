i=0;
j=0;
bluesEnergy=[];
classicalEnergy=[];
countryEnergy=[];
discoEnergy=[];
hiphopEnergy=[];
jazzEnergy=[];
metalEnergy=[];
popEnergy=[];
reggaeEnergy=[];
rockEnergy=[];
for i=1:100
[data1,fs]=audioread(sprintf('blues (%i).wav',i));
[data2,fs]=audioread(sprintf('classical (%i).wav',i));
[data3,fs]=audioread(sprintf('country (%i).wav',i));
[data4,fs]=audioread(sprintf('disco (%i).wav',i));
[data5,fs]=audioread(sprintf('hiphop (%i).wav',i));
[data6,fs]=audioread(sprintf('jazz (%i).wav',i));
[data7,fs]=audioread(sprintf('metal (%i).wav',i));
[data8,fs]=audioread(sprintf('pop (%i).wav',i));
[data9,fs]=audioread(sprintf('reggae (%i).wav',i));
[data10,fs]=audioread(sprintf('rock(%i).wav',i));
bluesEnergy=[bluesEnergy sum(data1.^2)];
classicalEnergy=[classicalEnergy sum(data2.^2)];
countryEnergy=[countryEnergy sum(data3.^2)];
discoEnergy=[discoEnergy sum(data4.^2)];
hiphopEnergy=[hiphopEnergy sum(data5.^2)];
jazzEnergy=[jazzEnergy sum(data6.^2)];
metalEnergy=[metalEnergy sum(data7.^2)];
popEnergy=[popEnergy sum(data8.^2)];
reggaeEnergy=[reggaeEnergy sum(data9.^2)];
rockEnergy=[rockEnergy sum(data10.^2)];
end


X=[bluesEnergy;
    classicalEnergy;
    countryEnergy;
    discoEnergy;
    hiphopEnergy;
    jazzEnergy;
    metalEnergy;
    popEnergy;
    reggaeEnergy;
    rockEnergy];

[id,k]=kmeans(X,3);




