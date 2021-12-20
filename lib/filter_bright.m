function maskedRGBImage = filter_bright(RGB)
%filter_bright Removes unwanted bright areas of an RGB Image 

arguments
       RGB (:,:,3) uint8 % input image must contain the 3 channels
end


I = rgb2hsv(RGB);

channel1Min = 0.241;
channel1Max = 1.000;

channel2Min = 0.63;
channel2Max = 1.000;

channel3Min = 0.7;
channel3Max = 1.000;

sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

maskedRGBImage = RGB;

maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
