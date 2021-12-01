function digit = get_digit(binaryImage,N)
%GET_DIGITS Summary of this function goes here
%   Detailed explanation goes here
CC = bwconncomp(binaryImage);
stats = regionprops(CC,'basic');

    digit_row =  imcrop(binaryImage,stats(N).BoundingBox);
    digit = imresize(digit_row, [NaN 32]);
end

