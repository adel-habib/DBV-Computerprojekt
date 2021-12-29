function digit = get_digit(binaryImage,N)
%GET_DIGITS returns a normalised binary image of a single digit using
%connected components and regionprops 
% inputs:
%   binaryImage  : A binary image 
%   N            : Index of the digit (Left to the right HH:MM:SS)
% outputs:
%   digit        : a normalised binary image of a single digit
    arguments
        binaryImage (:,:) logical
        N           (1,1) {mustBeInteger,mustBeGreaterThan(N,0)} 
    end
    
    CC                          = bwconncomp(binaryImage);
    stats                       = regionprops(CC,'basic');
    try
    digit_row                   =  imcrop(binaryImage,stats(N).BoundingBox);
    catch ERR
        msg                     = "Error!,get_digit.m failed with Index N: %d: Out of range";
        ErrMsg                  = sprintf(msg,N);
        uiwait(errordlg(ErrMsg,"Index Error"));
        msgText                 = getReport(ERR);
        warning(msgText);
        return
    end
    digit                       = imresize(digit_row, [NaN 32]);
end

