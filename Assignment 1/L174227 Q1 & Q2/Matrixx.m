function [x]=Matrixx(mat,r,c,h,w)
mat2=zeros(h,w);
a=1;
for i=r:(h+r)-1
    b=1;
    for j=c:(c+w)-1
        mat2(a,b)=mat(i,j);
        b=b+1;
    end
    a=a+1;
end
x=mat2;
end
        

