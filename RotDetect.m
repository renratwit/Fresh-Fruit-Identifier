close all;
clc;

img = imread('./Image_Dataset/apple_scab.jpg');
gray = rgb2gray(img);
gray = im2double(gray);
gray = imadjust(gray, [], [], 0.5);

% gray = histeq(gray);

figure; imshow(gray);

%Morphological Operations
% gray = medfilt2(gray, [10 10]);
se = strel('disk', 3);
g = imclose(gray, se);
g = imopen(g, se);

figure; imshow(g);

g = imbinarize(g, 0.4);

[B, L] = bwboundaries(g, 'noholes');
figure; imshow(label2rgb(L, @jet, [.5 .5 .5]))

figure; imshow(g);


