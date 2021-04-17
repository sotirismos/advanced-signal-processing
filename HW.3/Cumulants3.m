function[c3]=Cumulants3(X,L,K,M)

c3=zeros(41,41);

values=zeros(K,M);

% Find the values of X(k)
for i=0:(K-1)
    for j=1:M
        values(i+1,j)=X(M*i+j);
    end
end

mean_values=zeros(K,1);

% Find the mean value of each subset
for i=1:K
    s=0;
    for j=1:M
        s=values(i,j)+s;
    end
    mean_values(i)=s/M;
end

% Subtract mean values from each subset
for i=1:K
    for j=1:M
        values(i,j)=values(i,j)-mean_values(i);
    end
end

% Estimation of 3rd order cumulants of each subset
r=zeros(K,41,41);
for i=1:K
    for m=-L:L
        for n=-L:L
            low=[0 -m -n];
            upper=[M-1 M-1-m M-1-n];
            s1=max(low);
            s2=min(upper);
            s=0;
            for l=s1:s2
                s=values(i,l+1)*values(i,l+1+m)*values(i,l+1+n)+s;
            end
            r(i,m+21,n+21)=s/M;
        end
    end
end

% Mean values of cumulants of all subsets
for m=-L:L
    for n=-L:L
        for i=1:K
            c3(m+21,n+21)=r(i,m+21,n+21)+c3(m+21,n+21);
        end
        c3(m+21,n+21)=c3(m+21,n+21)/K;
    end
end
end

