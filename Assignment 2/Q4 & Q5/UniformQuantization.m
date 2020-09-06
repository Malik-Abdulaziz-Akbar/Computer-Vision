function [x]= UniformQuantization(image,grey,map)
factor=256/grey;
left_factor=log2(factor);
right_factor=log2(grey);
a=uint8(256);
lower=bitsll(a,left_factor);
upper=bitsrl(a,right_factor);
middle=bitsrl(a,right_factor+1);
[r,c]=size(image);
y=zeros(r,c);
if map==1
    for i=1:r
        for j=1:c
            z=bitand(image(i,j),lower);
            y(i,j)=z;
        end
    end
end
if map==2
    for i=1:r
        for j=1:c
            z=bitor(image(i,j),upper);
            y(i,j)=z;
        end
    end
end
if map==3
    for i=1:r
        for j=1:c
            z=bitand(image(i,j),lower);
            z=bitor(z,middle);
            y(i,j)=z;
        end
    end
end
x=y;
end