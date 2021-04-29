% Advanced Signal Processing, Homework 3
% Moschos Sotirios, 9030

clear
clc
close all

% Load real discrete signal X(k)
load('SignalX.mat');

%{
% Calculate the mean
m1=0;
for i=1:N
    m1=V(i)+m1;
end
m1=m1/N;

% Calcuate the std
sd1=0;
for i=1:N
    sd1=((V(i)-m1)^2+sd1);
end
sd1=sqrt(sd1/N);

% Calculate the skewness
skew=0;
for i=1:N
    skew=((V(i)-m1)^3)+skew;
end
skew=skew/((N-1)*(sd1^3));
%}   

% Calculate the skewness of V(k)
sk=skewness(V);

% Estimate and plot the 3rd order cumulants of X(k)
K=32;
M=64;
L=20;
c3=Cumulants3(X,L,K,M);

% 3d plot
axisX=-20:20;
axisY=-20:20;
surf(axisX,axisY,c3)
title('3rd order cumulants of x[k]')

% Estimate the impulse response of the MA system using the Giannakis formula
q=5;
hest=Giannakis(c3,q);

% Sub-Sup estimate using Giannakis formula
qsub=q-2;
hsub=Giannakis(c3,qsub);

qsup=q+3;
hsup=Giannakis(c3,qsup);

% Estimate the MA-q system output and calculate the NRMSE
[nrmse,Xest]=NRMSE(hest,V,N,X);

% Repeat the latter, for sub-estimation and over-estimation
[nrmsesub,Xsubest]=NRMSE(hsub,V,N,X);
[nrmsesup,Xsupest]=NRMSE(hsup,V,N,X);

% Repeat the above but instead of x[k] use the noise infected output y[k]
snr=(30:-5:-5); % SNR values
y=zeros(length(snr),N);
hesty=zeros(length(snr),q+1);
nrmsey=zeros(1,length(snr));

for i=1:length(snr)
    y(i,:)=awgn(X,snr(i),'measured');
    c3y=Cumulants3(y(i,:),L,K,M);
    hesty(i,:)=Giannakis(c3y,q);
    set(0,'DefaultFigureVisible','off');
    [nrmsey(i),~]=NRMSE(hesty(i,:),V,N,y(i,:));
end

set(0,'DefaultFigureVisible','on')
figure;
plot(snr,nrmsey);
title('NRMSE of y vs SNR range')
xlabel('SNR(dB)')
ylabel('NRMSE')
    







