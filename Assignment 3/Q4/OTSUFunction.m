function [x,tres] = OTSUFunction(I)
I = rgb2gray(I);
histo = imhist(I);
[r,c]=size(I);
mean_image = histo./(r*c);
mean_image = mean_image';
thresholds = zeros(1,255);
for i = 1:255
    u1 = 0;
    u2 = 0;
    sigma_square1 = 0;
    sigma_square2 = 0;
    p1 = sum(mean_image(1:i));
    p2 = sum(mean_image(i+1:256));
    for j = 1:256
        if j <=i
            u1 = u1+ (j*mean_image(j)/p1);
        else
            u2 = u2+ (j*mean_image(j)/p2);
        end
    end
    for k = 1:256
        if k <=i
            sigma_square1 = sigma_square1+ ((k-u1)*(k-u1))*(mean_image(k)/p1);
        else
            sigma_square2 = sigma_square2+ ((k-u2)*(k-u2))*(mean_image(k)/p2);
        end
    end
    group_variance = p1*sigma_square1+p2*sigma_square2;
    thresholds(1,i) = group_variance;
end
least_variance = find(thresholds==(min(thresholds)));
tres = least_variance;
least_variance = least_variance/256;
I = imbinarize(I,least_variance);
x=I;
%imshow(I);
end
    
    