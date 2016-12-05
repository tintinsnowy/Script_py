function imgResult = nonmaxsup2d(imgHough)
    [row,col] = size(imgHough); 
    imgResult = ones(row,col);
    tmp = ones(row,col);
    for i=2:row-1
        for j = 2:col-1
            a = imgHough(i-1,j-1);b = imgHough(i-1,j+1);
            c = imgHough(i+1,j-1);d = imgHough(i+1,j+1);
            a1 = imgHough(i,j-1);b1 = imgHough(i,j+1);
            c1 = imgHough(i-1,j);d1 = imgHough(i+1,j);
            extend = imgHough(i,j)*ones(1,8);
            com = [a,b,c,d,a1,b1,c1,d1];
          if(sum(extend>com)==8)
             tmp(i,j)=imgHough(i,j);
          else 
             tmp(i,j)=0;
          end
        end
    end
     imgResult=imgHough;
     imgResult(2:row-1, 2:col-1)=tmp(2:row-1, 2:col-1);
	% insert your code here
end
