function derivative = gaussdx(x, sigma)
% insert your code here
    derivative = -1/(sqrt(2*pi)*sigma^3)*x.*exp(-x.*x/(2*sigma^2));
end
