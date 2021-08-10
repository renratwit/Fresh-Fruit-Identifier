close all;
clc;

img = imread('./Image_Dataset/apple_spots.jpg');
imageSegmenter(img)
figure; imshow(img);
% img = rgb2gray(img);

img = histeq(img);
% img = medfilt2(img, [5 5]);

red = img(:, :, 1);
green = img(:, :, 2);
blue = img(:, :, 3);

figure; imshow(red);
figure; imshow(green);
figure; imshow(blue);

level = 0.37;
bw2 = imbinarize(blue, level);
figure; imshow(bw2);

% BW = imbinarize(img);

% figure; imshow(BW);

% level = graythresh(img);
% BW = imbinarize(img, level);

%BW = edge(BW, 'canny', 0.1);

SE = strel('disk', 1);

%BW = imclose(BW, SE);


% figure; imshow(BW);

%BW = imfill(BW, 'holes');
%bwconncomp(BW)

%%%%%%%%%%%%%%%%%%%%%%%%