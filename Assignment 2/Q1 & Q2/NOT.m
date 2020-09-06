function [x] = NOT(image1)
    [r,c]=size(image1);
    y=zeros(r,c);
    for i=1:r
        for j=1:c
            a=de2bi(image1(i,j),8,2,'left-msb');
            b=~a;
            d=bi2de(b,'left-msb');
            y(i,j)=d;
        end
    end
    x=uint8(y);
end