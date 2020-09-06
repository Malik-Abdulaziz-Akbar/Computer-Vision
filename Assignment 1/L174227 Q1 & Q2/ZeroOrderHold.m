function [x]=ZeroOrderHold(M)
mask=[1,1;1,1];
Padded=Zero(M);
I=Convo(Padded,mask);
[r,c]=size(I);
I=I(2:r-1,2:c-1);
x=I;
end