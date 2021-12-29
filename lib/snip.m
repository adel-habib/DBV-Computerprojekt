function snipped_image = snip(binary_image)
%SNIP Crops a binary image into the bounding box of the of its content.
% Slices the image into rows and cols and finds the white edges. 

    if ~islogical(binary_image)
        warnMessage  = sprintf("Warning!, Image passed to snip.m must be logical!");
        uiwait(warndlg(warnMessage));
    end 
    
    % If cropping fails, return the originl binary image without crashing.
    try
        [h, v]              = find(binary_image); 
        top                 = min(h);
        bottom              = max(h);
        left                = min(v);
        right               = max(v);
        snipped_image       = binary_image(top:bottom, left:right);
    catch ERR
        msgText = getReport(ERR);
        warning(msgText);
        st = dbstack;
        warning("Failed to Crop the image, %s",st.name);
        snipped_image       = binary_image;
    end

end

