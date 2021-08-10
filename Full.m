close all;
clc;

img = imread('Image_Dataset/small_banana3.jpg');

hsvImage = rgb2hsv(img);


hsvImage(:,:,2) = hsvImage(:,:,2) * 1.6;
hsvImage(:,:,3) = hsvImage(:,:,3) * 1.4;

rgbImage = hsv2rgb(hsvImage);
img = rgbImage;

%figure 1
figure; imshow(img);
img = rgb2gray(img);

img = medfilt2(img, [3 3]);
img = imadjust(img);



BW = edge(img, 'canny', 0.1);

SE = strel('disk', 9);

BW = imdilate(BW, SE);
BW = imdilate(BW, SE);

%figure 2
figure; imshow(BW);

BW = imfill(BW, 'holes');

SE = strel('diamond', 3);

BWdil = imerode(BW, SE);

%figure 3
figure; imshow(BW);

numberOfTruePixels = sum(BW(:));
disp(numberOfTruePixels);


SE = strel('diamond', 3);

BWdil = imerode(BW, SE);

SE = strel('diamond', 5);

BWerode = imopen(BWdil, SE);

BW = imfill(BWerode, 'holes');



%figure 4
figure; imshow(BW);
numberOfTruePixels = sum(BW(:));
disp(numberOfTruePixels);



img = im2single(img);

nColors = 3;
% repeat the clustering 3 times to avoid local minima
pixel_labels = imsegkmeans(img,nColors,'NumAttempts',10);
%pixel_labels = imbinarize(pixel_labels, 0.4);

figure; imshow(pixel_labels, []);




se = offsetstrel('ball', 5, 5);
dilatedI = imdilate(img, se);
output = imsubtract(double(img), double(dilatedI));

figure;
subplot(121)
imshow(img);
subplot(122)
imshow(output);



