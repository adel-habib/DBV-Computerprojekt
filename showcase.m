
clc;
clear;
addpath("images")

N_DIGITS = 6; % number of digits in the 7 segment display
%COLOR    = "RED"; 


% The weakness of this approach is that it's color senstive

img = imread("im1.png");

bw = segment_red(img);


binaryImage = get_blobs(bw,N_DIGITS);
 
imshow(get_digit(binaryImage,6))
%imshow(crop_binary(binaryImage));
%imshow(binaryImage)
