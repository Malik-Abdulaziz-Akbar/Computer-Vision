function x = MeanFilter(I, nr, nc)
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
        sum_of_elements = sum(M,'all');
        average = round(sum_of_elements/len);
        result(k,z) = average;
        z=z+1;
    end
    k=k+1;
end
x = result;
end