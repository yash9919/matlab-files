prompt = 'Enter the number of users ';
M = input(prompt)
prompt = 'Enter the number of relay ';
N=input(prompt)
prompt = 'Enter the number of iterations ';
S=input(prompt)
A=randn(M,S)

[r,c]=max(A,[],1);
x=zeros(2,S);
%stores values of max values in 1st row of x
x(1,:)=r;
%stores values of row no. of max element from A in the seconf row of x
x(2,:)=c


