function [X,V] = Signals()

N=2048; % Data length
h=[1.0 0.93 0.85 0.72 0.59 -0.1]; % MA-q process coefficients
q=length(h);

V=exprnd(1,[1,N]); % Construct v(k), i.i.d, non gaussian

for i=1:N
    V(i)=V(i)-mean(V); % I subtract the mean, in order to get better NRMSE
end

X=zeros(1,N);

for i=1:N
   for k=0:q-1
       if i>k
           X(i)=X(i)+h(k+1)*V(i-k);
       end
   end
end
end

