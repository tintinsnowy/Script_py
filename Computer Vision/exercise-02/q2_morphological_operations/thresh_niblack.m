function res = thresh_niblack(img, r, k)
%Intuition:
[row,col]=size(img);
res=img;
 for i=1:row
     for j=1:col
         [m,v]= get_window_mean_var(img,i,j,r);
         T= m+k*v;
         if(res(i,j)>=T)
             res(i,j)=1;
         else 
             res(i,j)=0;
         end
     end
 end
 figure;
 imshow(res,[]);
end
