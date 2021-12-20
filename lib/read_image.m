function [resized_RGB] = read_image(path)
%READ_IMAGE reads an image given its handle / path

    if ~exist(path, 'file')
        errorMessage = sprintf('Error: %s does not exist in the search path folders.', path);
        uiwait(errordlg(errorMessage));
        return;
    end
    img = imread(path);
    [~, cols, channels] = size(img);
    if channels ~= 3
        errorMessage = sprintf('Error: %s isnt an RGB image.', path);
        uiwait(errordlg(errorMessage));
        return;
    end
    
    MAX_COLS = 600;
    if cols > MAX_COLS
       img = imresize(img,[NaN MAX_COLS]);
    end
    
    resized_RGB = img;
    
end

