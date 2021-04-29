function[h]=Giannakis(c3,q)

h=zeros(1,q+1);

for k=0:q
    h(k+1)=c3(q+21,k+21)/c3(q+21,21);
end
end

