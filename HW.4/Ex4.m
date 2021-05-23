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

t1=(0:length(y1m)-1)/Fs;
plot(t1,y1m(:,2))
title('Time domain signal of "A" Male')
xlabel('Time(s)')

figure;
t2=(0:length(y2m)-1)/Fs;
plot(t2,y2m(:,2))
title('Time domain signal of "E" Male')
xlabel('Time(s)')

figure;
t3=(0:length(y3m)-1)/Fs;
plot(t3,y3m(:,2))
title('Time domain signal of "I" Male')
xlabel('Time(s)')

figure;
t4=(0:length(y4m)-1)/Fs;
plot(t4,y4m(:,2))
title('Time domain signal of "O" Male')
xlabel('Time(s)')

figure;
t5=(0:length(y5m)-1)/Fs;
plot(t5,y5m(:,2))
title('Time domain signal of "U" Male')
xlabel('Time(s)')

figure;
t6=(0:length(y1f)-1)/Fs;
plot(t6,y1f(:,2))
title('Time domain signal of "A" Female')
xlabel('Time(s)')

figure;
t7=(0:length(y2f)-1)/Fs;
plot(t7,y2f(:,2))
title('Time domain signal of "E" Female')
xlabel('Time(s)')

figure;
t8=(0:length(y3f)-1)/Fs;
plot(t8,y3f(:,2))
title('Time domain signal of "I" Female')
xlabel('Time(s)')

figure;
t9=(0:length(y4f)-1)/Fs;
plot(t9,y4f(:,2))
title('Time domain signal of "O" Female')
xlabel('Time(s)')

figure;
t10=(0:length(y5f)-1)/Fs;
plot(t10,y5f(:,2))
title('Time domain signal of "U" Female')
xlabel('Time(s)')

% Real Cepstrum of each voice signal
c1m=rceps(y1m(:,2));
c1f=rceps(y1f(:,2));
figure;
plot(c1m,'blue');
hold on
plot(c1f,'red');
legend('"A"-Male','"A"-Female')

c2m=rceps(y2m(:,2));
c2f=rceps(y2f(:,2));
figure;
plot(c2m,'blue');
hold on
plot(c2f,'red');
legend('"E"-Male','"E"-Female')

c2m=rceps(y2m(:,2));
c2f=rceps(y2f(:,2));
figure;
plot(c2m,'blue');
hold on
plot(c2f,'red');
legend('"E"-Male','"E"-Female')

c3m=rceps(y3m(:,2));
c3f=rceps(y3f(:,2));
figure;
plot(c3m,'blue');
hold on
plot(c3f,'red');
legend('"I"-Male','"I"-Female')

c4m=rceps(y4m(:,2));
c4f=rceps(y4f(:,2));
figure;
plot(c4m,'blue');
hold on
plot(c4f,'red');
legend('"O"-Male','"O"-Female')

c5m=rceps(y5m(:,2));
c5f=rceps(y5f(:,2));
figure;
plot(c5m,'blue');
hold on
plot(c5f,'red');
legend('"U"-Male','"U"-Female')
