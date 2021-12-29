function masked_img = filter_bright(RGB)
%filter_bright MASK to filter out vlaues that are not typical to LEDs segments
% Inputs:
%   RGB : RGB Image
% Outputs: 
%   masked_img: Filtered out RGB Image

    arguments
           RGB (:,:,3) uint8 
    end

    im               = rgb2hsv(RGB);
    % thresholds
    [min1,max1]     = deal(0.241,1);
    [min2,max2]     = deal(0.630,1);
    [min3,max3]     = deal(0.700,1);
    
    sliderBW        = (im(:,:,1) >= min1) ...
                    & (im(:,:,1) <= max1) ...
                    & (im(:,:,2) >= min2) ...
                    & (im(:,:,2) <= max2) ...
                    & (im(:,:,3) >= min3) ...
                    & (im(:,:,3) <= max3);
    BW              = sliderBW;
    masked_img      = RGB;
    
    masked_img(repmat(~BW,[1 1 3])) = 0;

end
