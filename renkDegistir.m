function renkDegistir=renkDegistir(image,R,G,B)
%kýrmýzý 250,0,0 renkDegistir(imagea,250,0,0)
%yesil 0,250,0 renkDegistir(imagea,0,250,0)
%mavi 0,0,250 renkDegistir(imagea,0,0,250)
%sarý 250,250,0 renkDegistir(imagea,250,250,0)
%gri 80,80,80 renkDegistir(imagea,80,80,80)
image=im2double(image);
% RGB to HSV conversion
    I = rgb2hsv(image);         
    range=[120,360];
    % Normalization range between 0 and 1
    range = range./360;
    
    % Mask creation
   
    maske = (I(:,:,1)>range(1)) & (I(:,:,1)<range(2));
   
    % Saturation is modified according to the mask
    I(:,:,2) = maske .* I(:,:,2);
    
    % HSV to RGB conversion
    I = hsv2rgb(I);

    [en,boy]=size(I(:,:,1));
    i=0;j=0;
    for i=1:en
        for j=1:boy
            if ((I(i,j,1)==1&&I(i,j,2)==1)&&(I(i,j,3)==1))
                I(i,j,:)=0;
            end
        end
    end

    
    
    I=im2uint8(I);
[en,boy] = size(I);
d=I;

for i=1:en
    for j=1:boy
        
        %koselerin yalnizca komsu uc hucresi hesaplaniyor
        if(i==1 && j==1)
            a = [d(i+1,j) d(i+1,j+1) d(1,j+1)];
            d(i,j) = median(a);
        elseif(i==en && j==1)
            a = [d(en-1,1) d(en-1,2) d(en,2)];
            d(i,j) = median(a);
        elseif(i==1 && j==boy)
            a = [d(1,boy-1) d(2,boy-1) d(2,boy)];
            d(i,j) = median(a);
        elseif(i==en && j==boy)
            a = [d(en-1,boy-1) d(en-1,boy) d(en,boy-1)];
            d(i,j) = median(a);
            
        %kenarlar bes adet komsu ile hesaplaniyor
        elseif(i==1 && j~=boy && j~=1)
            b = [d(1,j-1) d(1,j+1) d(2,j-1) d(2,j) d(2,j+1)];
            d(i,j) = median(b);
        elseif(i==en && j~=boy && j~=1)
            b = [d(en,j-1) d(en,j+1) d(en-1,j-1) d(en-1,j) d(en-1,j+1)];
            d(i,j) = median(b);
        elseif(j==1 && i~=en && i~=1)
            b = [d(i-1,1) d(i+1,1) d(i-1,2) d(i,2) d(i+1,2)];
            d(i,j) = median(b);
        elseif(j==boy && i~=en && i~=1)
            b = [d(i-1,boy-1) d(i,boy-1) d(i+1,boy-1) d(i-1,boy) d(i+1,boy)];
            d(i,j) = median(b);
        
        %orta noktalar sekiz komsunun medyani alinarak hesaplaniyor
        else
            s = [d(i-1,j-1) d(i-1,j) d(i-1,j+1) d(i,j-1) d(i,j+1) d(i+1,j-1) d(i+1,j) d(i+1,j+1)];
            d(i,j) = median(s);
        end
    end
end
    

imgR=d(:,:,1)-(255-R);
imgG=d(:,:,2)-(255-G);
imgB=d(:,:,3)-(255-B);

imgA(:,:,1)=imgR;
imgA(:,:,2)=imgG;
imgA(:,:,3)=imgB;

imshow(imgA);
