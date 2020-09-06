function x = Decimation(Image, nr, nc)
    
   % I = MeanSmoothing(Image);
    I = Image;
   [r,c] = size(I);
    result = zeros(nr,nc);
    new_r=round(r/nr);
    new_c = round(c/nc);
    len = (new_r*new_c);
    k=1;
    for i=1:new_r:r-new_r
        z=1;
        for j=1:new_c:c-new_c
            M = I(i:i+new_r-1,j:j+new_c-1);
            
            result(k,z) = M(1,1);
            z=z+1;
        end
        k=k+1;
    end
    x = result;
end