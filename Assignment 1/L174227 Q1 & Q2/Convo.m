function [res]=Convo(mat,mask)
mask=rot90(mask,2);
[row,col]=size(mat);
res=zeros(row,col);

[mrow,mcol]=size(mask);
if mrow==mcol
    if mod(mrow,2)==1
        k=mrow-3;
        k=k/2;
        for x=2+k:row-1-k
            for y=2+k:col-1-k
                masked=mask.*mat(x-1-k:x+1+k, y-1-k:y+1+k);  
                result=sum(masked(:)); 
                res(x, y)=result; 
            end 
        end
    end
    if mod(mrow,2)==0
        if mrow==2
            for x=2:row-1
                for y=2:col-1

                    %multiplying mask value with the corresponding image pixel value 
                    masked=mask.*mat(x-1:x, y-1:y);  
                    result=sum(masked(:)); 
                    res(x, y)=result; 
                end 
            end
        end
    end
end
end
