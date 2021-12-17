function [segmented_img] = compartment(img)
%CPMPARTMENT RGB senstive segmentation of an image 
%   removes the dull areas of an image and stresses the unicolor areas.  

    arguments
       img (:,:,3) uint8 % input image must contain the 3 channels
    end

    SE_SHAPE        =    "rectangle";

    [r,g,b]         =    imsplit(img);
    img             =    r > 231 | b > 231 ;
    imgbw           =    imbinarize(uint8(img),"adaptive");
    se              =    strel(SE_SHAPE,[10 4]);
    se2             =    strel('line',4,45);
    se3             =    strel('line',4,135);
    im              =    imclose(imgbw,se);
    im              =    imclose(im,se2);
    segmented_img   =    imclose(im,se3);
end



