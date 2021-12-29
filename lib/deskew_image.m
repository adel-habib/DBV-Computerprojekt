
function deskewed_image = deskew_image(image)

%DESKEW_IMAGE Deskews the input binary image using spatial transforms 
% Corrects the angle of the digits, (To gain correct classification the digits have to be horizontal) 
% The correction angle is found using the hough transform
% The rotation is achieved using an affine matrix
% inputs:
%   image           : a binary image
% outputs:
%   deskewed_image  : a binary image 
    
    % If correction fails, inform the user yet don't crash the program 
    % continue the evaluation and adjust the confidence
    try
        [~, c]                  =   size(image);
        [H,theta,rho]           =   hough(image);
        peak                    =   houghpeaks(H,1,'threshold',ceil(0.9*max(H(:))));
        lines                   =   houghlines(image,theta,rho,peak,'FillGap',0.8*c,'MinLength',40);

        
        if(lines.theta<0)
            rotation_angle      =   90-abs(lines.theta);
        else
            rotation_angle      = lines.theta-90;
        end

        rel_2d                  = imref2d(size(image));
        M_Z1                    = [cosd(rotation_angle) -sind(rotation_angle) 0];
        M_Z2                    = [sind(rotation_angle) cosd(rotation_angle) 0];
        M_Z3                    = [0 0 1];
        affine_matrix           = [M_Z1; M_Z2; M_Z3];
        tform                   = affine2d(affine_matrix);

        rel_out                 = images.spatialref.internal.applyGeometricTransformToSpatialRef(rel_2d,tform);
        rel_out.ImageSize       = rel_2d.ImageSize;
        xTrans                  = mean(rel_out.XWorldLimits) - mean(rel_2d.XWorldLimits);
        yTrans                  = mean(rel_out.YWorldLimits) - mean(rel_2d.YWorldLimits);
        rel_out.XWorldLimits    = rel_2d.XWorldLimits+xTrans;
        rel_out.YWorldLimits    = rel_2d.YWorldLimits+yTrans;
          deskewed_image        = imwarp(image, tform, 'OutputView', rel_out, 'interp', 'cubic', 'fillvalues', 0);
    catch ERR
        deskewed_image          = image;
        msg                     = "Warning!, Failed to deskew the image, accuracy of estimation might be comprimised";
        warnMessage             = sprintf(msg);
        uiwait(warndlg(warnMessage));
        msgText                 = getReport(ERR);
        warning(msgText);
    end

  end