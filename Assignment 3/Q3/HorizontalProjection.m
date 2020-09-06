function x = HorizontalProjection(Image)
    [r,c]=size(Image);
    row = zeros(1,r);
    for i=1:r
        sum=0;
        for j=1:c
           if Image(i,j)==1
               sum=sum+1;
           end
        end
        row(1,i) = sum;
    end
    x=row;
end