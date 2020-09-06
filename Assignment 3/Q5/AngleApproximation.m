function x = AngleApproximation(I)
    [r,c] = size(I);
    Image = zeros(r,c);
    for i= 1:r
        for j = 1:c
            if (I(i,j)>= 0 && I(i,j)< 22.5) || (I(i,j)>= 157.5 && I(i,j)< 202.5) || (I(i,j)>= 337.5 && I(i,j) <= 360)
                Image(i,j) = 0;
            elseif (I(i,j)>= 22.5 && I(i,j)< 67.5) || (I(i,j)>= 202.5 && I(i, j) < 247.5)
                Image(i,j) = 45;
            elseif (I(i,j)>= 67.5 && I(i,j)< 112.5) || (I(i,j)>= 247.5 && I(i,j) < 292.5)
                Image(i,j) = 90;
            elseif (I(i,j)>= 112.5 && I(i,j)< 157.5) || (I(i,j)>= 292.5 && I(i,j)< 337.5)
                Image(i, j) = 135;
            end
        end
    end
    x = Image;
end