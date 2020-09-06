function [x] = NAND(image1,image2)
    y=AND(image1,image2);
    y=NOT(y);
    x=uint8(y);
end