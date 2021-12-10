function [matched_array,euler,aspect_ration] = match(digit)
%MATCH Matches digits to tempelates using normalised sum of differences
% inputs:
%   digit  : A binary image of single digit 
% outputs:
%   matched_array           : Array of confidence 
%   euler                   : Euler number of digit
%   aspect_ration           : Aspect ration of the digit

    
    matches = ones(10,1);
    for im  = 1:10
           sd               = 0; % sum of differences 
           path             = num2str(im-1) + ".png";
           tempelate        = imread(path);
           [width, height]   = size(tempelate);
           normalised_digit = imresize(digit,[width height]);
           
       for i= 1:width
            for j= 1:height
                
                         sd = sd + abs((tempelate(i,j)- normalised_digit(i,j)));
            end
       end
       
       normalised_sd        = 1 - (sd / (width * height));
       matches(im)          = normalised_sd;
       
    end
    
    aspect_ration           = size(digit,2)/size(digit,1);
    euler                   = bweuler(digit);
    matched_array           = matches;
    
end

