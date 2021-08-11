function [image, count] = Identification(input)
%img = imread('apple_scab.jpg');
img = input;

hsvImage = rgb2hsv(img);


hsvImage(:,:,2) = hsvImage(:,:,2) * 1.6;
hsvImage(:,:,3) = hsvImage(:,:,3) * 1.4;

rgbImage = hsv2rgb(hsvImage);
img = rgbImage;

%figure; imshow(img);
img = rgb2gray(img);

img = medfilt2(img, [3 3]);
img = imadjust(img);



BW = edge(img, 'canny', 0.16);

SE = strel('disk', 5);

%BW = imdilate(BW, SE);
BW = imdilate(BW, SE);

%figure; imshow(BW);

BW = imfill(BW, 'holes');

SE = strel('diamond', 3);



%figure; imshow(BW);


SE = strel('diamond', 3);

BWdil = imerode(BW, SE);

SE = strel('diamond', 5);

BWerode = imopen(BWdil, SE);

BW = imfill(BWerode, 'holes');

BWerode = imdilate(BWdil, SE);

%figure; imshow(BW);
numberOfTruePixels = sum(BW(:));
%disp(numberOfTruePixels);

image = BW;
count = numberOfTruePixels;
end
