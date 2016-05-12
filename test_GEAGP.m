t=1:10; % time points
Nr=3; % number of replicate
sigma = 1; %noise variance
diff_exp=1; % differentially expressed or not =0)
[y,y1]=generate_two_sets_of_time_course(t,Nr,sigma,diff_exp); %Generate two sets of time courses
p=two_sample_test(y,y1,t); % The GEAGP test
disp(p);% Display p-value