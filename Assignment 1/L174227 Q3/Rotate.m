function [x]=Rotate(M,degree)
radians=degree*pi/180;
[r, c] = size(M);  
newRow =  r;
newCol =  c;
newImage = zeros(r*2, c*2);
newImage(ceil(newRow/2):(ceil(newRow/2)+r-1),ceil(newCol/2):(ceil(newCol/2)+c-1)) = M;
row_mid=ceil((r*2)/2);
col_mid=ceil((c*2)/2);
rotated_image=zeros(r*2,c*2);
for i=1:(r*2)
    for j=1:(c*2)
         x= (i-row_mid)*cos(radians)+(j-col_mid)*sin(radians)+row_mid;
         y=-(i-row_mid)*sin(radians)+(j-col_mid)*cos(radians)+col_mid;
         x=round(x);
         y=round(y);
         if (x>=1 && y>=1 && x<=r*2 && y<=c*2)
              rotated_image(i,j)=newImage(x,y);        
         end

    end
end
x=rotated_image;
end