function H = estimate_homography(px1, py1, px2, py2)
  len = length(px1)*2
  A = zeros(2*len,9);
  
  for i=1:len-1
    A(i,1:3)=[px1(round(i/2)),py1(round(i/2)),1];
    A(i,7:9)=[-px1(round(i/2))*px2(round(i/2)),-px2(round(i/2))*py1(round(i/2)),-px2(round(i/2))];

    i = 1+i;
    A(i,4:6)=[px1(round(i/2)),py1(round(i/2)),1];
    A(i,7:9)=[-px1(round(i/2))*py2(round(i/2)),-py2(round(i/2))*py1(round(i/2)),-py2(round(i/2))];
  end
  
  [U,S,V] = svd(A);
  
  h = V(:,end)./V(end,end);
  H = reshape(h,3,3);
 end
