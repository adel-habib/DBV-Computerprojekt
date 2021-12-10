function [guess,confidence] = match(digit)
%MATCH Matches digits to tempelates using normalised sum of differences
% inputs:
%   digit  : A binary image of single digit 
% outputs:
%   matched_array           : Array of confidence 


    aspect_ratio            = size(digit,2)/size(digit,1);
    euler                   = bweuler(digit);
    
    if aspect_ratio < 0.4
        guess      = 1;
        confidence = 1;
        return
    end
    
    if euler == -1
        guess = 8;
        confidence = 1;
        return
    end
    
    group_1 = [2 3 5 7];
    group_2 = [0 4 6 9];
    all     = (0:1:9);
    
    
    
    if euler == 1
        candidates = group_1;
    elseif euler == 0
        candidates = group_2;
    else
        candidates = all;
    end
    
    matches = ones(size(candidates));
    for im  = 1: length(candidates)
           sd               = 0; % sum of differences 
           path             = num2str(candidates(im)) + ".png";
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
    
    
    [confidence , guess_ind] = max(matches);
    guess = candidates(guess_ind);
end

