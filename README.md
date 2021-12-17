# Digitaler Bildverarbeitung Computerprojekt
# Digital Image processing | Project

Final project for the module Digital Image processing. The goal of the project is to utilize the principals of digital image processing and morphology to perform simple optical charachter recognition on 7 segment display. 

Images of 7 segment display in varying conditions and times have been taken. the Matlab script can guesses the timestamp displayed as well as estimate the confidence of the guess. 

In order to reproduce the pictures or generate test data, The module 7segment_display contains HTML / CSS / JS files that can be used to mimic a digital clock 

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


