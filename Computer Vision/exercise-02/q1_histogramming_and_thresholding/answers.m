function a = answers()
	a.grayvalue_histogram = 'The histogram value range is from 0 to 255 and because it is the gray scale image, the pixel is concentrated in the middle of the histogram.';
	a.cumulative_histogram = 'For cumulative histogram, the slope of the histogram can show the pixel distribution of the image. That is, if the slope is bigger, the distribution of the pixel value is small, and vice versa.';
	a.threshold = 'Descibe how you chose the threshold. Set the threshold = 0 to 255 iterationly and calculate the number of pixels bigger ar lower than the threshold. Second, calculate the within-class variance. Third, use the equation in the slide2 to calculate the sigma between. Finally, choose the minimum sigma and find its corresponding threshold, the threshold is our solution.';
	a.niblack = 'What do you observe? Comparing with otsu method, the niblack can show more details. ';
end