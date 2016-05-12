function [m] = mean_curve(K_T,K_T1,S,y)
%K_T is GP covariance matrix
%S=Noise variance
%y=data
n=size(y,1);
m=pinv(pinv(K_T1)+n*pinv(K_T+S))*n*pinv(K_T+S)*mean(y)';
m=m';
end

