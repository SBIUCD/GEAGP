function [ p] = two_sample_test(y1,y2 ,t)
%% Input variables y1=Nr X Nt time series 1, y2=Nr X Nt time series 2, t= time points
% Nr = number of replicates
% Nt = Number of time points
% Output variable p = p-value
options = optimoptions('fmincon','Algorithm','sqp','Display','off');
a1=fmincon(@(p)nlikelihood(p,y1,t),ones(5,1),[],[],[],[],ones(5,1)*0.00001,[],[],options);
a2=fmincon(@(p)nlikelihood(p,y2,t),ones(5,1),[],[],[],[],ones(5,1)*0.00001,[],[],options);
a3=fmincon(@(p)nlikelihood(p,[y1;y2],t),ones(5,1),[],[],[],[],ones(5,1)*0.00001,[],[],options);

l1=likelihood(y1,t,a1);
l2=likelihood(y2,t,a2);
l3=likelihood([y1;y2],t,a3);
p=1-chi2cdf(2*(l1+l2-l3),5);
end

