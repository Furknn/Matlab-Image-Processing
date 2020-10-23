
imflat = double(reshape(im, size(im,1) * size(im,2), 3));

K = 3
[kIDs, kC] = kmeans(imflat, K, 'Display', 'iter', 'MaxIter', 150, 'Start', 'sample');


colormap = kC / 256; % Scale 0-1, since this is what matlab wants

imout = reshape(uint8(kIDs), size(im,1), size(im,2));

imwrite(imout - 1, colormap, 'C:\Path\Of\Output\Image.png');
