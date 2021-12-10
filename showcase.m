
clc;
clear;
addpath("images")
addpath("images/tempelates")

N_DIGITS = 6;


% The weakness of this approach is that it's color senstive

img = imread("tempelate_1.png");

bw = segment(img);


binaryImage = get_blobs(bw,N_DIGITS);
[num, conf] = match(get_digit(binaryImage,6))

imshow(binaryImage)
%bweuler(get_digit(binaryImage,3))
%imshow(crop_binary(binaryImage));
%imshow(binaryImage)
