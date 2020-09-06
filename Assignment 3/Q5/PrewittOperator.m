function [p1,p2] = PrewittOperator(Image)
    vertical_filter = [-1,0,1;-1,0,1;-1,0,1];
    horizontal_filter = [-1,-1,-1;0,0,0;1,1,1];
    [r,c] = size(Image);
    pad = zeros(r+2,c+2);
    [rowpad,colpad] = size(pad);
    pad(2:rowpad-1,2:colpad-1)=Image;
    x = Convo(pad,vertical_filter);
    y = Convo(pad,horizontal_filter);
    x = x(2:rowpad-1,2:colpad-1);
    y = y(2:rowpad-1,2:colpad-1);
    p1 = x;
    p2 = y;
end