function hist = histogram(img)
% insert your code here
 hist=zeros(1,256);
  [x,y]=size(img);
  for i=1:x
     for j=1:y
           hist(img(i,j))=hist(img(i,j))+1;
     end
  end
end
