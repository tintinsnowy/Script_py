function h=myhist(filename, bins)
	%read the image and convert it to grayvalues.
    img = double(rgb2gray(imread(filename)));
    
    [row, col] = size(img);
    img = reshape(img,row*col,1);
    h = hist(img,bins);
    %normalized
    h = h/sum(h);
end
