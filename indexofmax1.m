%Programme to find max of 3D array using max function

sd=zeros(1,4,10000)
for x = 1:1
    for y = 1:4
        for z = 1:10000
            sd(x,y,z)=randn(1,1,1);
        end
    end
end
o=max(max(sd,[],2),[],1);
maxofsd=max(o)

%finding the index of the maximum value
d=find(sd==maxofsd);

%converting index to subscript
[r,c,v] = ind2sub(size(sd),d)


    