function p = parameters()
	p.cellsize = 8;
	p.n_bins = 16;
	p.sigma = 2;
	p.offset_lr = 4;
	p.offset_tb = 4;
	p.car = 1;
	p.no_car = -1;
    % set to true, if you want to use interpolation (d)
	p.use_interpolation = false;
    % set to true, if you want to use nms (c)
    p.use_nms = false; 
    % choose test image numbers here ( in [0:169] )
	p.test_img_nums = [];
    p.thresh = 0.5;
end
