function wm = weighted_mean(vec, rmin, rmax)
%Intuition:
%(1)Vec: vector of histogram
%(2)rmin:minimal range
%(3)rmax:maximal range
wm = 0
for i = rmin:rmax
    wm = wm+ vec(i);   
end
end
