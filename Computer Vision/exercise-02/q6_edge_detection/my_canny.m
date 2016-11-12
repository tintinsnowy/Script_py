function edge_image = my_canny(img, sigma, theta_low, theta_high)
% insert your code here

    [imgMag, imgDir]=gradmag(img, sigma);
    imgDir =(isnan(imgDir) ~= 1);
    imgMax = nonmaxsupcanny(imgMag,imgDir);
    visited = imgMax < theta_low;
    high = (imgMag>=theta); 
    visited(:,1) = true;
    visited(:,end) = true;
    visited(1,:) = true;
    visited(end,:) = true; 
    

function [] = follow_edge(x, y)
    global visited
    global img_res;
    visited(x,y) = true;
    img_res(x,y) = 1;
    offx = [1 1 0 -1 -1 -1 0 1];
    offy = [0 1 1 1 0 -1 -1 -1];
    for i=1:8,
        idx_x = x + offx(i);
        idx_y = y + offy(i);
        if visited(idx_x, idx_y) == false
            follow_edge(idx_x, idx_y);
        end
    end
end

end
