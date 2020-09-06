function x= GuassianFIlter(Image)
filter = [1,4,7,4,1;4,16,26,16,4;7,26,41,26,7;4,16,26,16,4;1,4,7,4,1]./273;
[r,c] = size(Image);
pad = zeros(r+4,c+4);
[rowpad,colpad] = size(pad);
pad(3:rowpad-2,3:colpad-2)=Image;
x = Convo(pad,filter);
x = x(3:rowpad-2,3:colpad-2);
end