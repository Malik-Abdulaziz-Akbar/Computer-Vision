function [x] = XOR(image1,image2)
    y=NAND(image1,image2);
    z=OR(image1,image2);
    z=AND(y,z);
    x=uint8(z);
end