function [blobs] = isolate_digits(img,n)
    %ISOLATE_DIGITS isolates and returns the digits of 7 segment display from the image 
    %   Using the regionprops properties the digits are located and isolated
    %   into a new binary image

    arguments
        img (:,:) logical
        n   (1,1) {mustBeInteger,mustBeGreaterThan(n,0)} = 6
    end
    
    [labeled_img, ~]                =   bwlabel(img);
    cc_props                        =   regionprops(labeled_img, 'area');
    allAreas                        =   [cc_props.Area];
    num_areas                       =   length(allAreas);
    
     if num_areas == 0
        errorMessage = sprintf("Segmentation Error!, Couldn't extract the digits of the display.");
        uiwait(errordlg(errorMessage));
        return;
     elseif num_areas < n
         warnMessage = sprintf("Warning!, Couldn't locate all the digits of the display, the accuracy of this estimation will be compromised");
         uiwait(warndlg(warnMessage));
         n                          =   num_areas;
    end
    
    try
    [~, sortIndexes]                =   sort(allAreas, 'descend');
    biggestBlob                     =   ismember(labeled_img, sortIndexes(1:n));
    blobs = biggestBlob > 0;
    catch ERR 
        st = dbstack;
        warning("Something went wrong in, %s",st.name);
        msgText = getReport(ERR);
        warning(msgText);
    end

        
end

