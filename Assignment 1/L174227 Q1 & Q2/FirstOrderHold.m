function [x]=FirstOrderHold(M)
mask=[.25,.5,.25;.5,1,.5;.25,.5,.25];
I=Convo(M,mask);
[r,c]=size(I);
I=I(2:r-1,2:c-1);
x=I;
end