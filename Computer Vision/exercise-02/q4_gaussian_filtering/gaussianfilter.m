function outimg = gaussianfilter(inimg, sigma)
% insert your code here
% filter size: fsize = 2 * 3*sigma +1;
% shape ='valid'
% convolve
halfwid = 3*sigma;
[xx,yy] = meshgrid(-halfwid:halfwid, -halfwid:halfwid);
 gau = exp(-1/(2*sigma^2) * (xx.^2 + yy.^2));
 [row,col] = size(inimg);
 outimg=inimg;
 
 for i=1:row
     for j=1:col
        xl = max(1,i-halfwid);
        xl2 = halfwid+1-(i-xl);
        xh = min(i+halfwid,row);
        xh2 = halfwid+1+(xh-i);
        yl = max(1,j-halfwid) ;
        yl2 = halfwid+1-(j-yl);
        yh = min(j+halfwid,col);
        yh2 = halfwid+1+(yh-j);
        outimg(i,j)= sum(sum(inimg(xl:xh,yl:yh).*gau(xl2:xh2,yl2:yh2)));
     end
 end
 [outimg,~]=mapminmax(outimg,0,1)
end
