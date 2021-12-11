function [segmented_img] = compartment(img)
%SEGMENT "Brightness" senstive segmentation of RGB image 
%   removes the dull areas of an image and stresses the unicolor areas.  

    arguments
       img (:,:,3) uint8 % input image must contain the 3 channels
    end

    SE_SIZE         =    6;
    SE_SHAPE        =    "square";

    [r,g,b]         =    imsplit(img);
    img             =    ~(r < 200) & (b < 200);
    imgbw           =    imbinarize(uint8(img),"adaptive");
    se              =    strel(SE_SHAPE,SE_SIZE);
    segmented_img   =    imclose(imgbw,se);
    
end



