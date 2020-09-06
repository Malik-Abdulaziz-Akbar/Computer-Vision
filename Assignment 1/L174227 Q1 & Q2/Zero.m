function [x]=Zero(mat)
[r,c]=size(mat);
I=zeros(((2*r)+1),((2*c)+1));
i=2;
for a=1:r
    j=2;
    for b=1:c
        I(i,j)=mat(a,b);
        j=j+2;
    end
    i=i+2;
end
x=I;
end
