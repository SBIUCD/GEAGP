Nt=5;
N=300;
sigma=2;
AUC=zeros(Nt,4);
for i=1:Nt
     [a,a1,a2,a3]=test_gp_algorithm(sigma,N);
     AUC(i,:)=[a,a1,a2,a3];
end
dlmwrite('results_2.0.txt',AUC);