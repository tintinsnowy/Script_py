function res = thresh(img, threshold)
% insert your code here
% get image dimensions: an RGB image has three planes
% reshaping puts the RGB layers next to each other generating
% a two dimensional grayscale image
[height, width] = size(img);

 for h = 1:height
     for w = 1:width
             if img(h,w)>=threshold
                 img(h,w)=1;
             else
                 img(h,w)=0;
             end
     end
 end
   res =logical(img);
  %imshow(res,[0,1])%or just[],track! because the matrix ranges from 0~255.It won't treat the 0/1 as bool,so....
  %imagesc(image)         % display the binarized image
end
