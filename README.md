# Digitaler Bildverarbeitung Computerprojekt
# Digital Image processing | Project

Final project for the module Digital Image processing. The goal of the project is to utilize the principles of digital image processing and morphology to perform simple optical character recognition on 7 segment display.

Images of 7 segment display in varying conditions and times have been taken. The Matlab script can guess the timestamp displayed, as well as estimate the confidence of the guess.

In order to reproduce the pictures or generate test data, The module 7segment_display contains HTML / CSS / JS files that can be used to mimic a digital clock

[!alt text](https://drive.google.com/file/d/1AMuOtIBFbDgQAMLHeophIuE3BpKihxv7/view?usp=sharing)
### 1- Run the HTML file on your localhost

```console
npm install http-server -g
cd PATH_TO_HTML_FILE
http-server index.html -p 5500
``` 

### 2- If your phone and PC are connected to the same network
Open the broweser in your phone and type the IP address of your PC/PORT

To get your IP

```console
hostname -I
``` 

### 3- If they are not connected the same network 
Run step 1, then 

```console
ngrok http 5500
``` 


