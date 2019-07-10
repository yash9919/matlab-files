clc
clear all;
prompt = 'Enter the number of relay';
K = input(prompt)
prompt = 'Enter the number of eavesdropper';

L=input(prompt)
prompt='Enter number of iterations';
S=input(prompt)
lambda=12;
for i =1:K
    for j=1:L
        for k=1:S
        RE(i,j,k)=randn(1);
    end
    end
end
RE

finalRE=RE.*lambda
