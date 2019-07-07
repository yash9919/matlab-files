prompt = 'Enter the number of users ';
M = input(prompt)
prompt = 'Enter the number of iterations ';
S=input(prompt)
for i =1:M
    for j=1:S
        SD(i,j)=randn(1);
    end
end
SD
%Generating lambda values between 10 to 20
a=10;
b=20;
lambda = a + (b-a).*rand(M,1)
%Scaling SD matrix with the lamba values
finalSD=SD.*lambda
