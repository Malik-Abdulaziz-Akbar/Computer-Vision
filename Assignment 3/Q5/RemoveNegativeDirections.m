function x = RemoveNegativeDirections(Image)
    [r,c] = size(Image);
    for i=1:r
        for j=1:c
            if Image(i,j)<0
                Image(i,j)=Image(i,j)+360;
            end
        end
    end
    x = Image;
end