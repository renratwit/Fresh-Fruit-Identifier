function [outputArg1] = Test(inputArg1)
%TEST Summary of this function goes here
%   Detailed explanation goes here
outputArg1 = 'hiiii';
img = inputArg1;

BW = imbinarize(img);
figure; imshow(BW);
end

