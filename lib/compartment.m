function [segmented_img] = compartment(img)
%CPMPARTMENT RGB senstive segmentation of an image 
%   This function first extract the "light Emitting" parts of the image
%   Then it closes them using Rect, line45 and line135 SEs 
%   Inputs:
%       img : RGB image
%   Outputs:
%       segmented_img : Binary Image
    arguments
       img (:,:,3) uint8 
    end

    SE1_SHAPE       =    "rectangle";
    SE2_SHAPE       =    "line";
    SE1_SIZE        =    [10 4];
    SE2_SIZE        =    6;
    THRESHOLD       =    235;
    [r,~,b]         =    imsplit(img);
    img             =    r > THRESHOLD | b > THRESHOLD ;
    imgbw           =    imbinarize(uint8(img),"adaptive");
    se1             =    strel(SE1_SHAPE,SE1_SIZE);
    se2             =    strel(SE2_SHAPE,SE2_SIZE,45);
    se3             =    strel(SE2_SHAPE,SE2_SIZE,135);
    im              =    imclose(imgbw,se1);
    im              =    imclose(im,se2);
    segmented_img   =    imclose(im,se3);
end



