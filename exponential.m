
for i =1:200
    for j=1:200
        X(i,j)=randn(1);
        Y(i,j)=randn(1);
    end
end
N=X.^2;
M=Y.^2;
Z=sqrt(N+M);
Z=0.5*Z;
S=Z.^2;
hist(S)
