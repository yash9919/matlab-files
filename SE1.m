clc
clear all;
prompt = 'Enter the number of eavesdroppper';
L = input(prompt)
prompt = 'Enter the number of iterations ';
S=input(prompt)
lambda=-3;
for i =1:L
    for j=1:S
        SE(i,j)=randn(1);
    end
end
SE

finalSE=SE.*lambda
