function [resized_RGB] = read_image(path)
%READ_IMAGE Summary of this function goes here
%   Detailed explanation goes here
    % Check if file exists.
    if ~exist(path, 'file')
        errorMessage = sprintf('Error: %s does not exist in the search path folders.', path);
        uiwait(warndlg(errorMessage));
        return;
    end
    img = imread(path);
    [rows, cols, channels] = size(img);
    if channels ~= 3
        errorMessage = sprintf('Error: %s isnt an RGB image.', path);
        uiwait(warndlg(errorMessage));
        return;
    end
    
    if cols > 600
       img = imresize(img,[NaN 600]);
    end
    
    resized_RGB = img;
    
end

