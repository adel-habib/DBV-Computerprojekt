function [Conf,Time] = read_display(path)
%READ_DISPLAY Wrapper function,excutes the program to read the Time
%displayed on an 7 segment display 
%   path : path to image

    im              = read_image(path);
    im              = filter_bright(im); 
    im              = compartment(im);
    im              = deskew_image(im);
    im              = isolate_digits(im);
    im              = snip(im);
    [Time,Conf]     = guess_time(im);
end

