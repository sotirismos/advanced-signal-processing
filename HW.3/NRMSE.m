function[NRMSE,Xest]=NRMSE(hest,V,N,X)

Xest=conv(hest,V);
figure
plot(X,'blue');
hold on
plot(Xest,'red');
legend('Original','Estimated')

rmse=0;
Xest=Xest(1:N);
for k=1:N
    rmse=(Xest(k)-X(k))^2+rmse;
end
rmse=sqrt(rmse/N);
NRMSE=rmse/(max(X)-min(X));
end


