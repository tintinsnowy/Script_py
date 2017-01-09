function h = myhist3(filename, bins)

	% read the image and convert it to double
    img = double(imread(filename));
    [row, col, wid] = size(img);
    Red = img(:,:,1);
    Green = img(:,:,2);
    Blue = img(:,:,3);
    r = Red./(Red+Green+Blue);
    g = Green./(Red+Green+Blue);
    h =zeros(bins, bins);

    
   R = round(r*(bins-1))+1;
   G = round(g*(bins-1))+1;
for i=1:row
    for j = 1:col
        x=R(i,j);
        y=G(i,j);
        h(x,y)=h(x,y)+1;
    end
end
    h(1,1) = 0; %black
	h(round((bins-1)/3)+1,round((bins-1)/3)+1) = 0; %gray (1,1,1)

	%normalize the histogram such that its integral (sum) is equal 1
	h = h./sum(sum(h));

	%reshape the histogram to obtain a 1D row vector of size 1 x bins^2
	h=reshape(h,1,bins^2); 

end
