function x = HysterisisThreshold(Image,low,high)
    [r,c] = size(Image);
    Result = zeros(r,c);
    for i = 1  : r
        for j = 1 : c
            if Image(i, j)<low
                Result(i,j)=0;
            elseif Image(i, j)>high
                Result(i,j)=1;
            elseif Image(i+1,j)>high || Image(i-1,j)>high || Image(i,j+1)>high || Image(i,j-1)>high || Image(i-1, j-1)>high || Image(i-1, j+1)>high || Image(i+1, j+1)>high || Image(i+1, j-1)>high
                Result(i,j) = 1;
            end
        end
    end
    x = Result.*255;
end
