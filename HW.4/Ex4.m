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
%plot(t1,y1m(:,2))
%title('Time domain signal of "A" Male')
%xlabel('Time(s)')

%figure;
t2=(0:length(y2m)-1)/Fs;
%plot(t2,y2m(:,2))
%title('Time domain signal of "E" Male')
%xlabel('Time(s)')

%figure;
t3=(0:length(y3m)-1)/Fs;
%plot(t3,y3m(:,2))
%title('Time domain signal of "I" Male')
%xlabel('Time(s)')

%figure;
t4=(0:length(y4m)-1)/Fs;
%plot(t4,y4m(:,2))
%title('Time domain signal of "O" Male')
%xlabel('Time(s)')

%figure;
t5=(0:length(y5m)-1)/Fs;
%plot(t5,y5m(:,2))
%title('Time domain signal of "U" Male')
%xlabel('Time(s)')

%figure;
t6=(0:length(y1f)-1)/Fs;
%plot(t6,y1f(:,2))
%title('Time domain signal of "A" Female')
%xlabel('Time(s)')

%figure;
t7=(0:length(y2f)-1)/Fs;
%plot(t7,y2f(:,2))
%title('Time domain signal of "E" Female')
%xlabel('Time(s)')

%figure;
t8=(0:length(y3f)-1)/Fs;
%plot(t8,y3f(:,2))
%title('Time domain signal of "I" Female')
%xlabel('Time(s)')

%figure;
t9=(0:length(y4f)-1)/Fs;
%plot(t9,y4f(:,2))
%title('Time domain signal of "O" Female')
%xlabel('Time(s)')

%figure;
t10=(0:length(y5f)-1)/Fs;
%plot(t10,y5f(:,2))
%title('Time domain signal of "U" Female')
%xlabel('Time(s)')


% Real Cepstrum of each voice signal

c1m=rceps(y1m(:,2));
c1f=rceps(y1f(:,2));
%figure;
%plot(c1m,'blue');
%hold on
%plot(c1f,'red');
%legend('"A"-Male','"A"-Female')
%xlabel('Frame Number')

c2m=rceps(y2m(:,2));
c2f=rceps(y2f(:,2));
%figure;
%plot(c2m,'blue');
%hold on
%plot(c2f,'red');
%legend('"E"-Male','"E"-Female')
%xlabel('Frame Number')

c3m=rceps(y3m(:,2));
c3f=rceps(y3f(:,2));
%figure;
%plot(c3m,'blue');
%hold on
%plot(c3f,'red');
%legend('"I"-Male','"I"-Female')
%xlabel('Frame Number')

c4m=rceps(y4m(:,2));
c4f=rceps(y4f(:,2));
%figure;
%plot(c4m,'blue');
%hold on
%plot(c4f,'red');
%legend('"O"-Male','"O"-Female')
%xlabel('Frame Number')

c5m=rceps(y5m(:,2));
c5f=rceps(y5f(:,2));
%figure;
%plot(c5m,'blue');
%hold on
%plot(c5f,'red');
%legend('"U"-Male','"U"-Female')
%xlabel('Frame Number')


% Apply Hamming window, liftering 

%for male "a"

%figure;
%plot(t1,c1m);
%title('Pitch estimation of male "A" vowel')
%xlabel('Times (s)')

w1=hamming(1200);
y1mnew=y1m(10000:11199,2); 
wy1m=y1mnew .* w1;
c1mnew=cceps(wy1m(:,1));
figure;
plot(c1mnew);

%for female "a"

%figure;
%plot(t6,c1f);
%title('Pitch estimation of female "A" vowel')
%xlabel('Times (s)')

w2=hamming(300);
y1fnew=y1f(17050:17349,2); 
wy1f=y1fnew .* w2;
c1fnew=cceps(wy1f(:,1));
figure;
plot(c1fnew);

%for male "e"

%figure;
%plot(t2,c2m);
%title('Pitch estimation of male "E" vowel')
%xlabel('Times (s)')

%w3=hamming();
%y2mnew=y2m(,2); 
%wy2m=y2mnew .* w2;
%c2mnew=cceps(wy2m(:,1));
%plot(c2mnew);

%for female "e"

%figure;
%plot(t7,c2f);
%title('Pitch estimation of female "E" vowel')
%xlabel('Times (s)')

%w4=hamming();
%y2fnew=y2f(,2); 
%wy2f=y2fnew .* w1;
%c2fnew=cceps(wy2f(:,1));
%plot(c2fnew);

%for male "i"

%figure;
%plot(t3,c3m);
%title('Pitch estimation of male "I" vowel')
%xlabel('Times (s)')

%w5=hamming();
%y3mnew=y1m(,2); 
%wy3m=y3mnew .* w5;
%c3mnew=cceps(wy3m(:,1));
%plot(c3mnew);

%for female "i"

%figure;
%plot(t8,c3f);
%title('Pitch estimation of female "I" vowel')
%xlabel('Times (s)')

%w6=hamming();
%y3fnew=y1m(,2); 
%wy1m=y1mnew .* w1;
%c3fnew=cceps(wy3f(:,1));
%plot(c3fnew);

%for male "o"

%figure;
%plot(t4,c4m);
%title('Pitch estimation of male "O" vowel')
%xlabel('Times (s)')

%w7=hamming();
%y4mnew=y1m(,2); 
%wy4m=y4mnew .* w7;
%c4mnew=cceps(wy4m(:,1));
%plot(c4mnew);

%for female "o"

%figure;
%plot(t9,c4f);
%title('Pitch estimation of female "O" vowel')
%xlabel('Times (s)')

%w8=hamming();
%y1fnew=y1m(,2); 
%wy4f=y1mnew .* w8;
%c4fnew=cceps(wy4f(:,1));
%plot(c4fnew);

%for male "u"

%figure;
%plot(t5,c5m);
%title('Pitch estimation of male "U" vowel')
%xlabel('Times (s)')

%w9=hamming();
%y5mnew=y5m(,2); 
%wy5m=y5mnew .* w9;
%c5mnew=cceps(wy5m(:,1));
%plot(c5mnew);

%for female "u"

%figure;
%plot(t10,c5f);
%title('Pitch estimation of female "U" vowel')
%xlabel('Times (s)')

%w10=hamming();
%y5fnew=y1m(,2); 
%wy5f=y5fnew .* w10;
%c5fnew=cceps(wy5f(:,1));
%plot(c5fnew);







