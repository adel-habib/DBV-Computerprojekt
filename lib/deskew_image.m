
function deskewed_image = deskew_image(image)

%DESKEW_IMAGE Deskew a binary image; align potentially skewed digits
%horizontally 
% inputs:
%   image: a binary image
% outputs:
%   deskewed_image : a binary image 

    try
        [~, c]              =   size(image);
        [H,theta,rho]       =   hough(image);
        peak                =   houghpeaks(H,1,'threshold',ceil(0.9*max(H(:))));
        lines               =   houghlines(image,theta,rho,peak,'FillGap',0.8*c,'MinLength',40);

        
        if(lines.theta<0)
            rotation_angle  =   90-abs(lines.theta);
        else
            rotation_angle  = lines.theta-90;
        end

        rel_2d              = imref2d(size(image));    
        tform               = affine2d([cosd(rotation_angle)    -sind(rotation_angle)     0; ...
                          sind(rotation_angle)     cosd(rotation_angle)     0; ...
                          0                          0                          1]);

        rel_out             = images.spatialref.internal.applyGeometricTransformToSpatialRef(rel_2d,tform);
        rel_out.ImageSize   = rel_2d.ImageSize;
        xTrans              = mean(rel_out.XWorldLimits) - mean(rel_2d.XWorldLimits);
        yTrans              = mean(rel_out.YWorldLimits) - mean(rel_2d.YWorldLimits);
       rel_out.XWorldLimits = rel_2d.XWorldLimits+xTrans;
       rel_out.YWorldLimits = rel_2d.YWorldLimits+yTrans;
          deskewed_image    = imwarp(image, tform, 'OutputView', rel_out, 'interp', 'cubic', 'fillvalues', 0);
      
    catch ERR
        deskewed_image      = image;
        warnMessage         = sprintf("Warning!, Failed to deskew the image, accuracy of estimation might be comprimised");
        uiwait(warndlg(warnMessage));
        msgText = getReport(ERR);
        warning(msgText);
    end

  end