
im=imread('15.jpg');
image = double(im)/255;

image = imresize(image, 0.8);

result = dehaze_fast(image, 0.9, 9);

figure, 
subplot(121)
imshow(image)
subplot(122)
imshow(result)
r=uint8(result*255);
s=ssim(r, im)

rmse
rmse = sqrt(immse(r,im))

AG
i1=rgb2gray(image);
i2=rgb2gray(result);
[Ix Iy]= gradient(i1);
AG1=(1/size(i1,1))*(1/size(i1,2))*sum(sum((sqrt((((Ix).^2) + ((Iy).^2))/2))))
[Ix2 Iy2]= gradient(i2);
AG2=(1/size(i2,1))*(1/size(i2,2))*sum(sum((sqrt((((Ix2).^2) + ((Iy2).^2))/2))))


e1=entropy(rgb2gray(im))
e2=entropy(rgb2gray(r))