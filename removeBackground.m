close all;
clc;
clear;

I = imread("brown_azz_banana.jpg");
I_gray = rgb2gray(I);
imshow(I);

L = superpixels(I, 500);

f = drawrectangle(gca, 'Color', 'g');

foreground = createMask(f, I);

b1 = drawrectangle(gca, 'Color', 'r');
b2 = drawrectangle(gca, 'Color', 'r');

background = createMask(b1, I) + createMask(b2, I);

BW = lazysnapping(I, L, foreground, background);
imshow(labeloverlay(I, BW, 'Colormap', [0 1 0]));

I_gray(BW==0) = 0;

imshow(I_gray);