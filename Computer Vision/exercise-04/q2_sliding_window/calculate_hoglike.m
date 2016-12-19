function hog = calculate_hoglike(img, cellsize, n_bins, sigma, offset_lr, offset_tb, interpolation)

    [mag,dir]=imgradient[img,sigma];
    mag = mag[offset_lr,offset_tb];
    dir = dir[offset_lr,offset_tb];
    [row,col] = size(mag);
    hog = zeros[row,col,n_bins];
    for i=1:row
        for j = 1:col
            [cells_x, cells_y, weights] = get_cell(i,j, cellsize, x, y);
            temp = mag(cells_x,cells_y).*weights;
            temp = temp*n_bins*dir(cells_x,cells_y)/pi;
            for k = 1:numel(temp)
                bin = temp(k);
                hog(cells_x, cells_y,bin)= hog(cells_x, cells_y,bin)+1;  
            end
        end
    end
   	
end

