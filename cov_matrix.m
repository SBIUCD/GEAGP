function [ c ] = cov_matrix( t,a,d )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
t1=repmat(t,length(t),1);
t2=repmat(t',1,length(t));

%c=a*exp((-(t1-t2).^2)/d);
c=a*exp((-abs(t1-t2)/d));
end

