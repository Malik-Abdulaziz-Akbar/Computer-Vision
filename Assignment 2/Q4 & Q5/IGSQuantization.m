function [x]= IGSQuantization(image,grey,map)
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
            Int = randi([1 factor],1,1);
            I=image(i,j)+Int;
            if(I>255)
                I=255;
            end
            z=bitand(I,lower);
            y(i,j)=z;
        end
    end
end
if map==2
    for i=1:r
        for j=1:c
            Int = randi([1 factor],1,1);
            I=image(i,j)+Int;
            if(I>255)
                I=255;
            end
            z=bitor(I,upper);
            y(i,j)=z;
        end
    end
end
if map==3
    for i=1:r
        for j=1:c
            Int = randi([1 factor],1,1);
            I=image(i,j)+Int;
            if(I>255)
                I=255;
            end
            z=bitand(I,lower);
            z=bitor(z,middle);
            y(i,j)=z;
        end
    end
end
x=y;
end