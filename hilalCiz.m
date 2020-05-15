function Hilaller=hilalCiz(resimDizisi,boyut,hilalSayisi,yon)
if ~exist('yon','var')
     yon = -1;
end


i=0;
j=0;

boyut=round(boyut);%yaricap

[resimY,resimX]=size(resimDizisi);
resimDizisi=uint8(resimDizisi);%gerekli

for c=1:hilalSayisi
    daireLocationY=randi(resimY);
    daireLocationX=randi(resimX);
    
    if boyut==-1
        yaricap=randi(200);
    else
        yaricap=boyut;
    end     
    
    for i=1:(yaricap*2)
        for j=1:(yaricap*2)
            if(i-yaricap)^2+(j-yaricap)^2<yaricap^2
                resimDizisi(i+daireLocationY,j+daireLocationX)=255;
            end
        end
    end
    i=0;j=0;
    
    
    kucukYaricap=round(abs((yaricap/100)*75));
    centerOffset=abs((yaricap-kucukYaricap));
    kucukDaireY=(daireLocationY+centerOffset);
    kucukDaireX=(daireLocationX+centerOffset);
    
    if yon==-1
        durum=randi(4);
    else
        durum=yon;
    end
    
    switch durum
        case 1
            kucukDaireY=kucukDaireY-centerOffset;
        case 3
            kucukDaireY=kucukDaireY+centerOffset;
        case 2
            kucukDaireX=kucukDaireX+centerOffset;
        case 4
            kucukDaireX=kucukDaireX-centerOffset;
    end

    for i=1:(kucukYaricap*2)
        for j=1:(kucukYaricap*2)
            if(i-kucukYaricap)^2+(j-kucukYaricap)^2<kucukYaricap^2
                resimDizisi(i+kucukDaireY,j+kucukDaireX)=0;
            end
        end
    end
    i=0;j=0;
end
imshow(resimDizisi);
Hilaller=resimDizisi;
