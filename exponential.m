
for i =1:200
    for j=1:200
        X(i,j)=randn(1);
        Y(i,j)=randn(1);
    end
end
X=X.^2;
Y=Y.^2;
Z=sqrt(X+Y);
Z=0.5*Z;
S=Z.^2;
hist(S)