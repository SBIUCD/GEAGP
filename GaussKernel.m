function [ cov ] = GaussKernel( t,l,v0,v1 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
t1=t;
t2=t;
x1=repmat(t1,length(t2),1);x2=repmat(t2',1,length(t1));
cov=v1*eye(size(x1))+v0*exp(-((x1-x2).^2)./l^2);
end


