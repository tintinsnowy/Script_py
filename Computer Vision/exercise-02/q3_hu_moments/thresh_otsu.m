function res = thresh_otsu(Image)
%Intuition:
%(1)pixels are divided into two groups
%(2)pixels within each group are very similar to each other 
%   Parameters:
%   t : threshold 
%   r : pixel value ranging from 1 to 255
%   q_L, q_H : the number of lower and higher group respectively
%   sigma : group variance
%   miu : Quadratic mean/ normal mean/ any other means
%   References : Wikepedia, 
%   for multi children Otsu method, please visit : https://drive.google.com/file/d/0BxbR2jt9XyxteF9fZ0NDQ0dKQkU/view?usp=sharing
%   pay attention: the input must be grayimages
nbins = 256;
counts = imhist(Image,nbins);
p = counts / sum(counts);
for t = 1 : nbins
   q_L = sum(p(1 : t))/t;
   q_H = sum(p(t + 1 : end));
   miu_L = q_L/t;%sum(p(1 : t) .* (1 : t)') / q_L; %q_L/t;
   miu_H = q_H/(nbins-t+1);%sum(p(t + 1 : end) .* (t + 1 : nbins)')/q_H; %
   sigma_b(t) = q_L * q_H * (miu_L - miu_H)^2;
end
[~,t] = max(sigma_b(:))
res = thresh(Image,t);
end
