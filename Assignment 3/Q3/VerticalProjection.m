function x = VerticalProjection(Image)
    [r,c]=size(Image);
    row = zeros(1,c);
    for i=1:c
        sum=0;
        for j=1:r
           if Image(j,i)==1
               sum=sum+1;
           end
        end
        row(1,i) = sum;
    end
    x=row;
end