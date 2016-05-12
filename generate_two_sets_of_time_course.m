function [y,y1] = generate_two_sets_of_time_course(t,Nr,sigma,flag)

m00=zeros(1,length(t));
l=gamrnd(15,1);
l1=gamrnd(25,1);
v=1;

m0=generate_time_course(t,m00,l,v,0);
m1=generate_time_course(t,m00,l1,v,0);

y=generate_time_course(t,repmat(m0,Nr,1),l,v,sigma);

if flag==1
    y1=generate_time_course(t,repmat(m1,Nr,1),l1,v,sigma);
else
    y1=generate_time_course(t,repmat(m0,Nr,1),l,v,sigma);
end



end

