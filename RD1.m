clc
clear all;
prompt = 'Enter the number of relay';
K = input(prompt)
prompt = 'Enter the number of users';
M=input(prompt)
prompt='Enter number of iterations';
S=input(prompt)
lambda=-4;
for i =1:K
    for j=1:M
        for k=1:S
        RD(i,j,k)=randn(1);
    end
    end
end
RD
finalRD=RD.*lambda
