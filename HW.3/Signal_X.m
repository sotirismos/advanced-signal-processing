% Advanced Signal Processing, Homework 3
% Moschos Sotirios, 9030

clear
clc
close all

N=2048; % Data length
b=[1.0 0.93 0.85 0.72 0.59 -0.1]; % MA-q process coefficients
q=length(b);

V=exprnd(1,[1,N]); % Construct v(k)
X=zeros(1,N);

for i=1:N
   for k=0:q-1
       if i>k
           X(i)=X(i)+b(k+1)*V(i-k);
       end
   end
end

filename='SignalX.mat';
save(filename)
    
    