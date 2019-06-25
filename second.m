open mymat.mat
load mymat.mat
R=rand(4,1)
x=rand(1,4)
y=randi([600 700],10,10)
max(y,[],1)
max(max(y,[],1),[],2)