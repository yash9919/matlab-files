prompt = 'Enter the number of users ';
M = input(prompt)
prompt = 'Enter the number of relay ';
N=input(prompt)
prompt = 'Enter the number of iterations ';
S=input(prompt)
A=randn(M,S);

%x stores value of max value from each column of A
x=max(A,[],1)

%loop to add index of highest value of each column in A 
%Index of highest value of each column is stored in a new row of each column of A
for i=1:S
  [r,c]=find(A==x(1,i));
   A(M+1,i)=r;
   
end
A(M+1,:)=round(A(M+1,:));
