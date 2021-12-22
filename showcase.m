clc;
clear;
format long
%% INCLUDE NECESSARY FOLDERS TO PATH
addpath("images")
addpath("images/tempelates")
addpath("lib")

%% PERFORMACE TEST OVER 10 different Images
NUM_IMAGES          = 10;
NUM_DIGITS          = 6;
images              = strings(1,NUM_IMAGES);
t                   = ones(1,NUM_IMAGES);
T                   = ones(1,NUM_DIGITS,NUM_IMAGES);
C                   = ones(1,NUM_IMAGES);
for i=1:10
    images(i)       = "im" + num2str(i) + ".png";
    tic
    [C(i),T(:,:,i)] = read_display(images(i));
    toc
    t(i)            = toc;
end
sprintf("Mean time is %.3fs, Mean confidence is: %.2f%%",mean(t),mean(C)*100)

%% Comparison of results with correct answers
results             = ones(NUM_IMAGES,1);
for i = 1: NUM_IMAGES
    results(i)      = polyval(T(:,:,i),NUM_IMAGES);
end
TEST_DATA           = textread("correct.txt");
table(TEST_DATA,results)


