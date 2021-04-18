% Advanced Signal Processing, Homework 2
% Moschos Sotirios, 9030

clear
clc
close all

%{
Repeat question 1 but with 50 realizations of X(k),
compare the mean values of the estimated power spectrum and bispectrum
%}

% Given data
lamda=zeros(1,6);
omega=zeros(1,6);

lamda(1)=0.12;
lamda(2)=0.3;
lamda(3)=lamda(1)+lamda(2);

lamda(4)=0.19;
lamda(5)=0.17;
lamda(6)=lamda(4)+lamda(5);

for k=1:6
    omega(k)=2*pi*lamda(k);
end

N=8192; % Data length

R=50; % Relizations

K=32;
M=256;
L=64;


%%%---1)Construct 50 relizations of X[k]---%%%

X=zeros(N,1);
A=zeros(N,1);
SE=dsp.SpectrumEstimator;
powerSpectrum=zeros(N,1); % Power spectrum estimations
bispectrumA=zeros(M,M); % Indirect method,Hexagonal
bispectrumB=zeros(M,M); % Indirect method,Parzen
bispectrumC=zeros(M,M); % Direct method


for i=1:R
    a=0;
    b=2*pi;
    phi(1)=(b-a).*rand+a;
    phi(2)=(b-a).*rand+a;
    phi(3)=phi(1)+phi(2);
    phi(4)=(b-a).*rand+a;
    phi(5)=(b-a).*rand+a;
    phi(6)=phi(4)+phi(5);
    for k=1:N
        X(k)=0;
        for j=1:6
            X(k)=X(k)+cos(omega(j)*k+phi(j));
        end
    end
    A=X+A;
    powerSpectrum=SE(X)+powerSpectrum;
    Y=reshape(X,M,K);
    [C3a,~]=bispeci(Y,L,M,0,'unbiased',128,1); % Hexagonal window with unity values, HOSA
    [C3b,~]=bispeci(Y,L,M,0,'unbiased',128); % Parzen window,check others parameters as well, HOSA, check for fftlength(256)
    [C3c,~]=bispecd(Y,M,0,M,0);
    bispectrumA(:,:)=bispectrumA+C3a;
    bispectrumB(:,:)=bispectrumB+C3b;
    bispectrumC(:,:)=bispectrumC+C3c;
end


% Calculation of means
signalMean=A/50;
powerSpectrumMean=powerSpectrum/50;
bispectrumAMean=abs(bispectrumA)/50;
bispectrumBMean=abs(bispectrumB)/50;
bispectrumCMean=abs(bispectrumC)/50;

% Plots
figure;
plot(X);
title('Real discrete process X')
xlabel('Samples')

fs=1;
n=length(powerSpectrumMean);
x=(0:n-1)*(fs/n);
y=powerSpectrumMean;
figure;
plot(x,y);
title('Power Spectrum Mean Values')
xlabel('f[HZ]')

f1=(0:M-1);
f2=f1;
figure;
contour(f1,f2,bispectrumAMean);
figure;
contour(f1,f2,bispectrumBMean);
figure;
contour(f1,f2,bispectrumCMean);




    
        
