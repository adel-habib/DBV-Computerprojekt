function [Time,Confidence] = guess_time(img)
%GUESS_TIME Summary of this function goes here
%   Detailed explanation goes here
N_DIGITS = 6;
T = ones(1,6);
Conf = ones(1,6);
for i=1:N_DIGITS
   [T(i), Conf(i)] = match(get_digit(img,i)); 
end
Confidence = sum(Conf)/length(Conf);
Time = T;
end

