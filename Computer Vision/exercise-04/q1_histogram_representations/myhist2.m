function h = myhist2(filename, bins)
    h = zeros(bins,bins,bins);
    %read the image and convert it to double.
    img = double(imread(filename));
    img = floor(img*(bins)/256)+1;
    
    [row, col, wid] = size(img);
    for i=1:row
        for j = 1:col
            x=img(i,j,1);
            y=img(i,j,2);
            z=img(i,j,3);
            
            h(x,y,z)=h(x,y,z)+1;
        end
    end
    %The black is too much, eliminate
    h(1,1,1)=0;
    % normonization
    h = h/sum(h(:));
    h = reshape(h,1,bins^3);

    %Get histValues for each channel

end
