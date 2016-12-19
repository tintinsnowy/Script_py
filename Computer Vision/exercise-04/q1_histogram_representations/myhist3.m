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
    %r = reshape(r,1,row*col);
    %r = hist(r,bins);
    %g = reshape(g,1,row*col);
    %g = hist(g,bins);
    
ratio = bins/max(max(max(r)),max(max(g)));
for i=1:row
    for j = 1:col
        x=ceil(r(i,j)*ratio);
        y=ceil(g(i,j)*ratio);
        if x==0 
            x=1;
        end
        if y==0 
            y=1;
        end
        h(x,y)=h(x,y)+1;
    end
end
    h = reshape(h,1,bins^2);

end
