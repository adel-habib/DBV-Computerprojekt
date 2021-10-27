function [segmented_img] = segment_red(img)
%SEGMENT_RED Color senstive segmentation
%   PROBLEM: VERY SENSTIVE TO COLOR!!! 
[r,g,b] = imsplit(img);
img = r > 200;
imgbw = imbinarize(uint8(img),"adaptive");
% Closing the image with a square structuar element ( apt. for the 7
% segment LEDs structure ) 
se = strel("square",3);
segmented_img = imclose(imgbw,se);
end

