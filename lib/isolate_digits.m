function [blobs] = isolate_digits(img,n)
    %ISOLATE_DIGITS isolates and returns the digits of 7 segment display from the image 
    %   Using the regionprops properties the digits are located and isolated
    %   into a new binary image

    arguments
        img (:,:) logical
        n   (1,1) {mustBeInteger,mustBeGreaterThan(n,0)} = 6
    end
    
    [labeled_img components]        = bwlabel(img);
    cc_props                        = regionprops(labeled_img, 'area');
    allAreas                        = [cc_props.Area];
    [sortedAreas, sortIndexes]      = sort(allAreas, 'descend');
    biggestBlob                     = ismember(labeled_img, sortIndexes(1:n));
    
    blobs = biggestBlob > 0;

end

