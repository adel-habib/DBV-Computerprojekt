
clc;
clear;
addpath("images")
addpath("images/tempelates")

N_DIGITS = 6;


% The weakness of this approach is that it's color senstive

img = imread("tempelate_1.png");

bw = segment(img);


binaryImage = get_blobs(bw,N_DIGITS);
for i=1:6
   match(get_digit(binaryImage,i))
end
imshow(binaryImage)
%bweuler(get_digit(binaryImage,3))
%imshow(crop_binary(binaryImage));
%imshow(binaryImage)
