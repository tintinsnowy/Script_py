function res = thresh(img, threshold)
% insert your code here
% get image dimensions: an RGB image has three planes
% reshaping puts the RGB layers next to each other generating
% a two dimensional grayscale image
   res =logical(img>=threshold);  
   %imshow(res,[0,1])%or just[],track! because the matrix ranges from 0~255.It won't treat the 0/1 as bool,so....
  %imagesc(image)         % display the binarized image
end
