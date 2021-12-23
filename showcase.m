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
%% a walk through with an example

% read_image.m
subplot(3,3,1);
im                  = read_image(images(5));
imshow(im);
title("read\_image.m")

% filter_bright.m
im                  = filter_bright(im);
subplot(3,3,2)
imshow(im);
title("filter\_bright.m")

% compartment.m
im                  = compartment(im);
subplot(3,3,3)
imshow(im);
title("compartment.m")

% deskew_image.m
im                  = deskew_image(im);
subplot(3,3,4)
imshow(im);
title("deskew\_image.m")

% isolate_digits.m
im                  = isolate_digits(im);
subplot(3,3,5)
imshow(im)
title("isolate\_digits.m")

% get_digit.m
digit               = get_digit(im,3);
subplot(3,3,6)
imshow(digit)
title("get\_digit.m")

% snip.m
im                  = snip(im);
subplot(3,3,7)
imshow(im)
title("snip.m")

% guess_time.m -> match.m
[Time, Conf]        = guess_time(im);


subplot(3,3,8)
xlim([0 1]);
ylim([0 1]);
set(gca(),"Color","None")
axis off ; 
text(0.5,0.5,num2str(polyval(Time,10)),'HorizontalAlignment', 'center','VerticalAlignment', 'middle','FontSize',18)
title("Ausgabe der Zeit")
subplot(3,3,9)
xlim([0 1]);
ylim([0 1]);
set(gca(),"Color","None")
axis off ; 
text(0.5,0.5,num2str(round(Conf,2)*100) + "%",'HorizontalAlignment', 'center','VerticalAlignment', 'middle','FontSize',18)
title("Konfidenzschätzung")
sgtitle("Schritt-für-Schritt-Ablauf")