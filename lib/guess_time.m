function [Time,Confidence] = guess_time(img,N_DIGITS)
%GUESS_TIME Wrapper function to estimate the 6 digits of the 7 segment display
    arguments
        img (:,:) logical
        N_DIGITS   (1,1) {mustBeInteger,mustBeGreaterThan(N_DIGITS,0)} = 6
    end
    T                    = ones(1,N_DIGITS);
    Conf                 = ones(1,N_DIGITS);
    for i=1:N_DIGITS
       [T(i), Conf(i)]   = match(get_digit(img,i)); 
    end
    Confidence           = sum(Conf)/length(Conf);
    Time = T;
end

