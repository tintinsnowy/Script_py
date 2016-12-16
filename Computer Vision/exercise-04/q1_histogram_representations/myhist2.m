function h = myhist2(filename, bins)
    h = zeros(bins,bins,bins);
	%read the image and convert it to double.
    img = double(imread(filename));
    [row, col, wid] = size(img);
    Red = img(:,:,1);
    Green = img(:,:,2);
    Blue = img(:,:,3);
    ratio = bins/256;
    for i=1:row
        for j = 1:col
            x=ceil(img(i,j,1)*ratio);
            y=ceil(img(i,j,2)*ratio);
            z=ceil(img(i,j,3)*ratio);
            if x==0 
                x=1;
            end
            if y==0 
                y=1;
            end
            if z==0  
                z=1;
            end
            h(x,y,z)=h(x,y,z)+1;
        end
    end
    h = reshape(h,1,bins^3);

    %Get histValues for each channel

end
