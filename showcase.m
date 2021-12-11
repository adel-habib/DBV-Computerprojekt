
clc;
clear;
addpath("images")
addpath("lib")
addpath("images/tempelates")
format long

img = imread('im1.png');
img = compartment(img);
img = isolate_digits(img);
img = snip(img);
%imshow(img)
img = deskew_image(img);
imshow(img)

[T,C] = guess_time(img);
fprintf("TIME IS: %d%d:%d%d:%d%d \n",T(1),T(2),T(3),T(4),T(5),T(6));
fprintf("Confidence is: %d \n",round(C*100,2))
%imshow(img)
