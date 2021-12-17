addpath("images")
addpath("images/tempelates")
addpath("lib")
path = "im3.png";
im = imread(path);
[conf, time] = read_display(path);
imshow(im)