function [X] = generate_time_course( t,m,l,v0,v1)
%generate
%m=zeros(Nr,length(t));
cov=GaussKernel(t,l,v0,v1);
X=mvnrnd(m,cov);
end

