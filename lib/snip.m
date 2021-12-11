function snipped_image = snip(binary_image)
%CROP_BINARY Crops a binary image
% Slices the image into rows and cols and find the white edges.  

[h, v] = find(binary_image); 
top = min(h);
bottom = max(h);
left = min(v);
right = max(v);
snipped_image = binary_image(top:bottom, left:right);

end

