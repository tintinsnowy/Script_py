function gaussian = gauss(x, sigma)
% insert your code here
% creates a 1D Gaussian from
% given vector of integer indices
gaussian = zeros(1,length(x));
    gaussian = exp((-x.*x)/(2*sigma^2))/(sqrt(2*pi)*sigma);
end
