function [segmented_img] = segment(img)
%SEGMENT_RED Color senstive segmentation
%   PROBLEM: VERY SENSTIVE TO COLOR!!!

SE_SIZE  = 6;
SE_SHAPE = "square";

[r,g,b] = imsplit(img);
img =~(r < 200) & (b < 200);
imgbw = imbinarize(uint8(img),"adaptive");
% Closing the image with a square structuar element ( apt. for the 7
% segment LEDs structure ) 
se = strel(SE_SHAPE,SE_SIZE);
segmented_img = imclose(imgbw,se);
end

