clc
clear all
prompt = 'Enter the number of users ';
M = input(prompt)
prompt = 'Enter the number of iterations ';
S=input(prompt)
lambda=11;
for i =1:M
    for j=1:S
        SD(i,j)=randn(1);
    end
end
SD
%Scaling SD matrix with the lamba values
finalSD=SD.*lambda
