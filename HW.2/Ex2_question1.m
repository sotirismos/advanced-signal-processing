% Advanced Signal Processing, Homework 2
% Moschos Sotirios, 9030

clear
clc
close all

% Given data
omega=zeros(1,6);
lamda=zeros(1,6);
phi=zeros(1,6);

lamda(1)=0.12;
lamda(2)=0.3;
lamda(3)=lamda(1)+lamda(2);

lamda(4)=0.19;
lamda(5)=0.17;
lamda(6)=lamda(4)+lamda(5);

for k=1:6
    omega(k)=2*pi*lamda(k);
end

% Uniformly distributed numbers in range [0,2pi]
a=0;
b=2*pi;
phi(1)=(b-a).*rand+a;
phi(2)=(b-a).*rand+a;
phi(3)=phi(1)+phi(2);
phi(4)=(b-a).*rand+a;
phi(5)=(b-a).*rand+a;
phi(6)=phi(4)+phi(5);

N=8192; % Data length

%%%---1)Construct X[k]---%%%

X=zeros(N,1);
for k=1:N
    for j=1:6
       X(k)=cos(omega(j)*k+phi(j))+X(k);
    end
end
figure;
plot(X);
title('Real discrete process X')
xlabel('Samples')



%%%---2)Estimate Power Spectrum.Use 128 max shiftings for autocorrelation---%%%

% Estimate power spectrum or power density spectrum using dsp.SpectrumEstimator 
SE=dsp.SpectrumEstimator;
C2a=SE(X);
fs=1;
n1=length(C2a);
x=(0:n1-1)*(fs/n1);
y=C2a;
figure;
plot(x,y);

% Estimate power spectrum using autorr function
m1=mean(X);
acf=autocorr(X,128); % ACF
m2=acf;
c2=m2-m1^2; % covariance
C2b=abs(fft(c2));
fs=1;
n2=length(C2b);
x=(0:n2-1)*(fs/n2);
y=C2b;
figure;
plot(x,y);



%%%---3)Estimate bispectrum using indirect and direct method---%%%

M1=256;
K1=32;
L1=64;

% Reshape a Nx1 vector to a KxM matrix
Y1=reshape(X,M1,K1);

% Indirect method
%{
figure;
C3a1_1=bisp3cum(Y1,K1,L1,'u'); % Uniform hexagonal window, specify biased or unbiased estimate
%}

figure;
C3a1_2=bispeci(Y1,L1,M1,0,'unbiased',128,1);% Hexagonal window with unity values, HOSA

hline1 = refline(0, 0); % Bispectrum symmetries
hline1.Color = 'k';
hline2 = refline(-1, 0.5);
hline2.Color = 'k';
hline3 = refline(1, 0);
hline3.Color = 'k';


figure;
C3a2_1=bispeci(Y1,L1,M1,0,'unbiased',128); % Parzen window,check others parameters as well, HOSA, check for fftlength(256)

hline1 = refline(0, 0); % Bispectrum symmetries
hline1.Color = 'k';
hline2 = refline(-1, 0.5);
hline2.Color = 'k';
hline3 = refline(1, 0);
hline3.Color = 'k';


%{
figure;
C3a2_2=bisp3cum(Y1,K1,L1,'p'); % Parzen window
%}

% Direct method
figure;
C3b=bispecd(Y1,M1,0,M1,0);

hline1 = refline(0, 0); % Bispectrum symmetries
hline1.Color = 'k';
hline2 = refline(-1, 0.5);
hline2.Color = 'k';
hline3 = refline(1, 0);
hline3.Color = 'k';


%%%---7)Repeat the steps above with different segment lengths---%%%

M2=512;
K2=16;
L2=64;

% Reshape a Nx1 vector to a KxM matrix
Y2=reshape(X,M2,K2);

% Indirect method
%{
figure;
C3c1_1=bisp3cum(Y2,K2,L2,'u'); % Uniform hexagonal window, specify biased or unbiased estimate
%}

figure;
C3c1_2=bispeci(Y2,L2,M2,0,'unbiased',128,1);% Hexagonal window with unity values, HOSA

hline1 = refline(0, 0); % Bispectrum symmetries
hline1.Color = 'k';
hline2 = refline(-1, 0.5);
hline2.Color = 'k';
hline3 = refline(1, 0);
hline3.Color = 'k';


figure;
C3c2_1=bispeci(Y2,L2,M2,0,'unbiased',128); % Parzen window,check others parameters as well, HOSA, check for fftlength(256)

hline1 = refline(0, 0); % Bispectrum symmetries
hline1.Color = 'k';
hline2 = refline(-1, 0.5);
hline2.Color = 'k';
hline3 = refline(1, 0);
hline3.Color = 'k';


%{
figure;
C3c2_2=bisp3cum(Y2,K2,L2,'p'); % Parzen window
%}

% Direct method
figure;
C3d=bispecd(Y2,M2,0,M2,0);

hline1 = refline(0, 0); % Bispectrum symmetries
hline1.Color = 'k';
hline2 = refline(-1, 0.5);
hline2.Color = 'k';
hline3 = refline(1, 0);
hline3.Color = 'k';


M3=128;
K3=64;
L3=64;

% Reshape a Nx1 vector to a KxM matrix
Y3=reshape(X,M3,K3);

% Indirect method

%{
figure;
C3e1_1=bisp3cum(Y3,K3,L3,'u'); % Uniform hexagonal window, specify biased or unbiased estimate
%}

figure;
C3e1_2=bispeci(Y3,L3,M3,0,'unbiased',128,1);% Hexagonal window with unity values, HOSA

hline1 = refline(0, 0); % Bispectrum symmetries
hline1.Color = 'k';
hline2 = refline(-1, 0.5);
hline2.Color = 'k';
hline3 = refline(1, 0);
hline3.Color = 'k';


figure;
C3e2_1=bispeci(Y3,L3,M3,0,'unbiased',128); % Parzen window,check others parameters as well, HOSA, check for fftlength(256)

hline1 = refline(0, 0); % Bispectrum symmetries
hline1.Color = 'k';
hline2 = refline(-1, 0.5);
hline2.Color = 'k';
hline3 = refline(1, 0);
hline3.Color = 'k';


%{
figure;
C3e2_2=bisp3cum(Y3,K3,L3,'p'); % Parzen window
%}

% Direct method
figure;
C3f=bispecd(Y3,M3,0,M3,0);

hline1 = refline(0, 0); % Bispectrum symmetries
hline1.Color = 'k';
hline2 = refline(-1, 0.5);
hline2.Color = 'k';
hline3 = refline(1, 0);
hline3.Color = 'k';





        












