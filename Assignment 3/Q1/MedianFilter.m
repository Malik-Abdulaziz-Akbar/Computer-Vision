function x = MedianFilter(I, nr, nc)
%imshow(I);
result = zeros(nr,nc);
[r,c] = size(I);
new_r=round(r/nr);
new_c = round(c/nc);
len = (new_r*new_c);
k=1;
for i=1:new_r:r-new_r
    z=1;
    for j=1:new_c:c-new_c
        M = I(i:i+new_r-1,j:j+new_c-1);
        M = M(:);
        M = M';
        M = sort(M);
        Mlen = size(M,2);
        if mod(Mlen,2) == 0
            median = (M(1,Mlen/2) + M(1,Mlen/2)+1)/2;
        else
            val = Mlen+1;
            val = val/2;
            median = M(1,val)/2;
        end
        result(k,z) = median;
        z=z+1;
    end
    k=k+1;
end
x = result;
end