close all;
clc;

lab_he = imread('./Image_Dataset/apple_scab.jpg');
lab_he = imadjust(lab_he, [], [], 0.3);
lab_he = rgb2lab(lab_he);

figure; imshow(imread('./Image_Dataset/apple_scab.jpg'))

% figure; imshow(lab_he);

ab = lab_he(:,:,2:3);
ab = im2single(ab);
nColors = 2;
% repeat the clustering 3 times to avoid local minima
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',3);
% pixel_labels = imbinarize(pixel_labels, 0.4);

figure; imshow(pixel_labels, []);

measurements = regionprops(logical(pixel_labels), 'Area');
area = sum([measurements.Area]);
area