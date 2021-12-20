function snipped_image = snip(binary_image)
%SNIP Crops a binary image of the dispay into the bounding box of the
%digits. Slices the image into rows and cols and find the white edges.  
    if ~islogical(binary_image)
        warnMessage  = sprintf("Warning!, Image passed to snip.m isn't logical! this might lead to unexpected behaviour!");
        uiwait(warndlg(warnMessage));
    end 
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

