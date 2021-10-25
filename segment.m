%% Segmenting the indv. digits of the 7 segment display 


clc;
clear;
addpath("images")

N_DIGITS = 4; % number of digits in the 7 segment display
COLOR    = "RED"; 

img = imread("7seg.jpeg");

subplot(3,2,1)
imshow(img)

[r,g,b] = imsplit(img);

subplot(3,2,2)
imshow(r)
% we expect hight intensity of the red color for the display digits
img = r > 200;
imgbw = imbinarize(uint8(img),"adaptive");


subplot(3,2,3)
imshow(imgbw)

% Closing the image with a square structuar element ( apt. for the 7
% segment LEDs structure ) 
se = strel("square",3);
bw = imclose(imgbw,se)

subplot(3,2,4)
imshow(bw)

[labeled_img n_components] = bwlabel(bw);
cc_meas = regionprops(labeled_img, 'area');
allAreas = [cc_meas.Area];
[sortedAreas, sortIndexes] = sort(allAreas, 'descend');
 biggestBlob = ismember(labeled_img, sortIndexes(1:4));
  % Convert from integer labeled image into binary (logical) image.
 binaryImage = biggestBlob > 0;
subplot(3,2,[5 6])
imshow(binaryImage)