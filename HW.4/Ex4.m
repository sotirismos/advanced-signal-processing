% Advanced Signal Processing, Homework 4
% Moschos Sotirios, 9030

clear
clc
close all

% Load the audio files
% Male
[y1m,Fs]=audioread('A-Male.m4a');
y2m=audioread('E-Male.m4a');
y3m=audioread('I-Male.m4a');
y4m=audioread('O-Male.m4a');
y5m=audioread('U-Male.m4a');

% Female
y1f=audioread('A-Female.m4a');
y2f=audioread('E-Female.m4a');
y3f=audioread('I-Female.m4a');
y4f=audioread('O-Female.m4a');
y5f=audioread('U-Female.m4a');

% Plots of time domain signals

t=(0:length(y1m)-1)/Fs;
plot(t,y1m)
title('Time domain signal of "A" Male')
xlabel('Time(s)')

figure;
t=(0:length(y2m)-1)/Fs;
plot(t,y2m)
title('Time domain signal of "E" Male')
xlabel('Time(s)')

figure;
t=(0:length(y3m)-1)/Fs;
plot(t,y3m)
title('Time domain signal of "I" Male')
xlabel('Time(s)')

figure;
t=(0:length(y4m)-1)/Fs;
plot(t,y4m)
title('Time domain signal of "O" Male')
xlabel('Time(s)')

figure;
t=(0:length(y5m)-1)/Fs;
plot(t,y5m)
title('Time domain signal of "U" Male')
xlabel('Time(s)')

figure;
t=(0:length(y1f)-1)/Fs;
plot(t,y1f)
title('Time domain signal of "A" Female')
xlabel('Time(s)')

figure;
t=(0:length(y2f)-1)/Fs;
plot(t,y2f)
title('Time domain signal of "E" Female')
xlabel('Time(s)')

figure;
t=(0:length(y3f)-1)/Fs;
plot(t,y3f)
title('Time domain signal of "I" Female')
xlabel('Time(s)')

figure;
t=(0:length(y4f)-1)/Fs;
plot(t,y4f)
title('Time domain signal of "O" Female')
xlabel('Time(s)')

figure;
t=(0:length(y5f)-1)/Fs;
plot(t,y5f)
title('Time domain signal of "U" Female')
xlabel('Time(s)')
