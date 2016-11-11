function gaussian = gauss(x, sigma)
% insert your code here
    for i = 1:length(x)
        gaussian(i) = (1/(sqrt(2*pi)*sigma))*exp(-x(i)^2/(2*sigma^2));
    end
end
