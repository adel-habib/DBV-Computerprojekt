function N_SQD = match(digit)
%MATCH Summary of this function goes here
%   Detailed explanation goes here
    temp = imread("0.png");
    
    [width height] = size(temp);
    n_digit = imresize(digit,[width height]);
    sumj = 0;
    sumi= 0;
    sqd = 0;
    for i=1:width
        for j=1:height
            
            sqd = sqd + abs((temp(i,j)- n_digit(i,j)));
            %sumj = sumj + temp(i,j);
            %sumi = sumi + n_digit(i,j);
            sqd_n = sqd / (width * height);
            
        end
    end
    N_SQD = sqd_n;
end

