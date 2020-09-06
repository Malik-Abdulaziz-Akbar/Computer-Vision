function x = MeanSmoothing(Image)
[r,c] = size(Image);
new_r=3;
new_c = 3;
len = (new_r*new_c);
for i=1:r-new_r
    for j=1:c-new_c
        M = Image(i:i+new_r-1,j:j+new_c-1);
        sum_of_elements = sum(M,'all');
        average = round(sum_of_elements/len);
        Image(i:i+new_r-1,j:j+new_c-1) = average;
    end
end
x = Image;
end