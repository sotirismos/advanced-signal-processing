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

% Calculate the cumulants of X(k)
K=32;
M=64;
L=20;
c3=Cumulants3(X,L,K,M);

% Estimate the impulse response of the MA system using the Giannakis formula
q=5;
hest=Giannakis(c3,q,L);

% Sub-Sup estimate using Giannakis formula
qsub=q-2;
hsub=Giannakis(c3,qsub,L);

qsuP=q+3;
hsup=Giannakis(c3,qsup,L);





