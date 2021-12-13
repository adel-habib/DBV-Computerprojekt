addpath("images")
addpath("images/tempelates")
addpath("lib")

im = imread("im5.png");

im = compartment(im);
% im = isolate_digits(im);
imshow(im)