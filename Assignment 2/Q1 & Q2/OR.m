function [x] = OR(image1,image2)
    [r,c]=size(image1);
    y=zeros(r,c);
    image2=imresize(image2,[r,c]);
    [r,c]=size(image1);
    for i=1:r
        for j=1:c
            a=de2bi(image1(i,j),8,2,'left-msb');
            b=de2bi(image2(i,j),8,2,'left-msb');
            f=a|b;
            d=bi2de(f,'left-msb');
            y(i,j)=d;
        end
    end
    x=uint8(y);
end