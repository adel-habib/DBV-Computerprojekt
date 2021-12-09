function digit = get_digit(binaryImage,N)
%GET_DIGITS returns a normalised binary image of a single digit
% inputs:
%   binaryImage  : A binary image 
%   N            : Index of the digit (Left to the right HH:MM:SS)
% outputs:
%   digit        : a normalised binary image of a single digit

CC = bwconncomp(binaryImage);
stats = regionprops(CC,'basic');

    digit_row =  imcrop(binaryImage,stats(N).BoundingBox);
    digit = imresize(digit_row, [NaN 32]);
end

