function [x] = NOR(image1,image2)
    y=OR(image1,image2);
    y=NOT(y);
    x=uint8(y);
end