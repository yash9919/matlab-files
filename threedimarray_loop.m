%3D array using loop

sd=zeros(1,4,10000)
for x = 1:1
    for y = 1:4
        for z = 1:10000
            sd(x,y,z)=randn(1,1,1);
        end
    end
end
save mymat.mat sd


