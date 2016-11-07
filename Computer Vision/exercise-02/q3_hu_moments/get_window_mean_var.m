function [m, v] = get_window_mean_var(img, x, y, r)
% insert your code here
% ima must be a grayimage
[row,col]=size(img);
lx =max(1,x-r);
hx =min(x+r,row);
ly =max(1,y-r);
hy =min(y+r,col);

win = img(lx:hx,ly:hy);
num_i = (hx-lx+1)*(hy-ly+1);
m = sum(sum(win))/num_i;
  win = win-m;
  v = sum(sum(win.*win))/num_i;
%
end
