function [x]=Zero_padding(mat)
[r,c]=size(mat);
I=zeros(r+2,c+2);
I(2:r+1,2:c+1)=mat;
x=I;
end