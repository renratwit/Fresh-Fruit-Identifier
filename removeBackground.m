close all;
clc;
clear;

I = imread("apple_spots.jpg");
I_gray = rgb2gray(I);
imshow(I);

L = superpixels(I, 500);

f = drawrectangle(gca, 'Color', 'g');

foreground = createMask(f, I);

b1 = drawrectangle(gca, 'Color', 'r');
b2 = drawrectangle(gca, 'Color', 'r');

background = createMask(b1, I) + createMask(b2, I);

BW = lazysnapping(I, L, foreground, background);

I_gray(BW==0) = 0;

figure; imshow(I_gray);

I_edge = edge(I_gray, 'canny', 0.1);

figure; imshow(I_edge);

se = strel('disk', 5);
I_edge = imclose(I_edge, se);
I_edge = imfill(I_edge, 'holes');
figure; imshow(I_edge);
