function x= CannyAlgo(Image,low,high)
I =double(rgb2gray(Image));
I = GuassianFIlter(I);
[p1,p2] = PrewittOperator(I);
direction = atan2(p2,p1);
direction = direction*180/pi;
direction = RemoveNegativeDirections(direction);
new_directions = AngleApproximation(direction);
%figure, imagesc(new_directions); colormap(gray(256));
magnitude = sqrt(p1.^2 + p2.^2);
thin_edges = NonMaximaSupression(new_directions, magnitude);
high_threshold= low*max(max(thin_edges));
low_threshold = high*max(max(thin_edges));
Canny = HysterisisThreshold(thin_edges, high_threshold, low_threshold);
x=Canny;
%imshow(Canny);
end
