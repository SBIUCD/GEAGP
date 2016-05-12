function [l] = nlikelihood(p,y,t)
%y=data
%=timepoints
%sig=noise variance
%v=radial basis function amplitude
%d=distance

a=0.1;
b=100;
sig=p(1);
v=p(2);
d=p(3);
v1=p(4);
d1=p(5);
K_T=cov_matrix(t,v,d);
K_T1=cov_matrix(t,v1,d1);
S=(sig^2)*eye(size(y,2));
m=mean_curve(K_T,K_T1,S,y);
ym=y-repmat(m,size(y,1),1);
%l=-0.5*(size(y,1)*log(det(S))+log(det(K_T))+log(det(K_T+S))+trace(ym*pinv(S+K_T)*ym'))+log(gampdf(sig,a,b))+log(gampdf(v,a,b))+log(gampdf(d,a,b))+log(gampdf(v1,a,b))+log(gampdf(d1,a,b));
%l=-0.5*(size(y,1)*log(det(K_T+S))+trace(ym*pinv(S+K_T)*ym'))+log(gampdf(sig,a,b))+log(gampdf(v,a,b))+log(gampdf(d,a,b))+log(gampdf(v1,a,b))+log(gampdf(d1,a,b));
%l=-0.5*(size(y,1)*(log(det(S))+log(det(K_T))+log(det(K_T+S)))+trace(ym*pinv(S+K_T)*ym'))+log(gampdf(sig,a,b))+log(gampdf(v,a,b))+log(gampdf(d,a,b))+log(gampdf(v1,a,b))+log(gampdf(d1,a,b));
l=-0.5*(size(y,1)*(log(det(K_T+S)))+trace(ym*pinv(S+K_T)*ym'))+log(gampdf(sig,a,b))+log(gampdf(v,a,b))+log(gampdf(d,a,b))+log(gampdf(v1,a,b))+log(gampdf(d1,a,b));
l=-l;
end

