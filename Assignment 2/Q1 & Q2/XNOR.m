function [x] = XNOR(image1,image2)
    y=XOR(image1,image2);
    y=NOT(y);
    x=uint8(y);
end