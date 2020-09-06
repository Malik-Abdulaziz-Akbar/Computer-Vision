function[image]=Subtract(img1,img2)
[r,c]=size(img1);
img2=imresize(img2,[r,c]);
image=zeros(r,c);
for i=1:r
    for j=1:c
        image(i,j)=img1(i,j)-img2(i,j);
    end
end