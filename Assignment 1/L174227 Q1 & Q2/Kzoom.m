function [m]=Kzoom(mat,k)
[old_r,old_c]=size(mat);
r=old_r+(old_r-1)*(k-1);
c=old_c+(old_c-1)*(k-1);
mat2=zeros(r,c);
x=1;
for i=1:old_r
    y=1;
    for j=1:old_c
        mat2(x,y)=mat(i,j);
        y=y+1;
        if j~=old_c
            diff=(mat(i,j+1)-mat(i,j))/k;
            for a=1:k-1
                mat2(x,y)=mat2(x,y-1)+diff;
                y=y+1;
            end
        end
    end
    x=x+k;
end
y=1;
for j=1:c
    x=1;
    for i=1:r
        x=x+1;
        if x<=r
            diff=(mat2(x-1+k,y)-mat2(x-1,y))/k;
            for a=1:k-1
                mat2(x,y)=mat2(x-1,y)+diff;
                x=x+1;
            end
        end
    end
    y=y+1;
end


m=mat2;
end