
clc;
clear;
addpath("images")

N_DIGITS = 4; % number of digits in the 7 segment display
COLOR    = "RED"; 


% The weakness of this approach is that it's color senstive

img = imread("7seg.jpeg");

bw = segment_red(img);


binaryImage = get_blobs(bw,4);


imshow(crop_binary(binaryImage));