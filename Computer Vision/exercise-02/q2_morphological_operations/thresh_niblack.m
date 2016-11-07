function res = thresh_niblack(img, r, k)
%Intuition:
[row,col]=size(img);
res=img;
 for i=1:row
     for j=1:col
         [m,v]= get_window_mean_var(img,i,j,r);
         T = m+k*v;
         res(max(1,i-r):min(i+r,row), max(1,j-r):min(j+r,col))= ...
         img(max(1,i-r):min(i+r,row), max(1,j-r):min(j+r,col))>=T;
     end
 end
 res =logical(res);
 imshow(res,[0,1]);
end
