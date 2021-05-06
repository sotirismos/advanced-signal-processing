% Advanced Signal Processing, Homework 3
% Moschos Sotirios, 9030

clear
clc
close all

N=2048; % Data length

% Variables for 3rd order cumulants of X(k)
K=32;
M=64;
L=20;

%order of impulse response
q=5;
qsub=q-2;
qsup=q+3;

snr=(30:-5:-5); %SNR levels
R=50; %Realizations

hest=zeros(R,q+1);
hsub=zeros(R,qsub+1);
hsup=zeros(R,qsup+1);

nrmse=zeros(1,R);
nrmsesub=zeros(1,R);
nrmsesup=zeros(1,R);
nrmsey=zeros(R,length(snr));

skew=0; % Initializing skewness
c3=zeros(2*L+1,2*L+1); % Initializing cumulants

set(0,'DefaultFigureVisible','off');

for i=1:R
    
    % Signals X, V
    [X,V]=Signals();

    % Calculate the skewness
    skew=skewness(V)+skew;

    % Estimate the cumulants
    c3(:,:)=Cumulants3(X,L,K,M);

    hest(i,:)=Giannakis(c3(:,:),q);
    hsub(i,:)=Giannakis(c3(:,:),qsub);
    hsup(i,:)=Giannakis(c3(:,:),qsup);

    [nrmse(i),xest]=NRMSE(hest(i,:),V,N,X);
    [nrmsesub(i),xestsub]=NRMSE(hsub(i,:),V,N,X);
    [nrmsesup(i),xestsup]=NRMSE(hsup(i,:),V,N,X);

    for j=1:length(snr)
        y(j,:)=awgn(X,snr(j),'measured');
        c3y=Cumulants3(y(j,:),L,K,M);
        hesty(j,:)=Giannakis(c3y,q);
        set(0,'DefaultFigureVisible','off');
        [nrmsey(i,j),~]=NRMSE(hesty(j,:),V,N,y(j,:));
    end
end

set(0,'DefaultFigureVisible','on')

% Calculate the means
skewmean=skew/R;

hestmean=mean(hest);
hsubmean=mean(hsub);
hsupmean=mean(hsup);

nrmsemean=mean(nrmse);
nrmsesubmean=mean(nrmsesub);
nrmsesupmean=mean(nrmsesup);

% NRMSRy vs snr

nrmseymean=mean(nrmsey);
figure;
plot(snr,nrmseymean);
title('NRMSE of y vs SNR range')
xlabel('SNR(dB)')
ylabel('NRMSE')






