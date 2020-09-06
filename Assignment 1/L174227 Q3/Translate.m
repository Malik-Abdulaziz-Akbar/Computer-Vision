function [x]=Translate(mat,rt,ct)
    [r,c]=size(mat);
    mat2=zeros(r,c);

    if rt>0
        for i=1:r-rt
            for j=1:c
                mat2(i+rt,j)=mat(i,j);
            end
        end
        x=mat2;
        mat=mat2;
    end
    if rt<0
        rt=rt*-1;
        for i=1:r-rt
            for j=1:c
                mat2(i,j)=mat(i+rt,j);
            end
        end
        x=mat2;
        mat=mat2;
    end
    mat2=zeros(r,c);
    if ct>0
        for i=1:c-ct
            for j=1:r
                mat2(j,i+ct)=mat(j,i);
            end
        end
        x=mat2;
    end
    if ct<0
        ct=ct*-1;
        for i=1:c-ct
            for j=1:r
                mat2(j,i)=mat(j,i+ct);
            end
        end
        x=mat2;
    end 
 
end