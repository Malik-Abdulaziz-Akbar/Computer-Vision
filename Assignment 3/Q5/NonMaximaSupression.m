function x = NonMaximaSupression(Direction, Magnitude)
    [r,c] = size(Direction);
    result = zeros(r,c);
    for i=2:r-1
        for j=2:c-1
            if (Direction(i,j)==0)
                result(i,j) = (Magnitude(i,j)==max([Magnitude(i,j),Magnitude(i,j+1),Magnitude(i,j-1)]));
            elseif (Direction(i,j)==45)
                result(i,j) = (Magnitude(i,j)== max([Magnitude(i,j),Magnitude(i+1,j-1),Magnitude(i-1,j+1)]));
            elseif (Direction(i,j)==90)
                result(i,j) = (Magnitude(i,j)== max([Magnitude(i,j),Magnitude(i+1,j),Magnitude(i-1,j)]));
            elseif (Direction(i,j)==135)
                result(i,j) = (Magnitude(i,j)== max([Magnitude(i,j),Magnitude(i+1,j+1),Magnitude(i-1,j-1)]));
            end
        end
    end
    x = result.*Magnitude;
end