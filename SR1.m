clc
clear all;
prompt = 'Enter the number of relay';
K = input(prompt)
prompt = 'Enter the number of iterations ';
S=input(prompt)
lambda=5;
for i =1:K
    for j=1:S
        SR(i,j)=randn(1);
    end
end
SR


finalSR=SR.*lambda
