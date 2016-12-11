	close all;
	clc;
	%parameters
	p = parameters();
	if rem(p.cellsize,2)
		error('The parameter cellsize must be divisable by 2');
	end
	a = answers();

	% list images
	positive_images = dir('TrainImages/pos*.pgm');
	negative_images = dir('TrainImages/neg*.pgm');
    
	%look at hoglike descriptor
	figure
    title('hoglike-img example');
	subplot(2,2,1)
	img = positive_images(1);
	img_data = imread(['TrainImages/', img.name]);
	imagesc(img_data);
	colormap('gray');
	axis equal;
	hog = calculate_hoglike(img_data, p.cellsize, p.n_bins, p.sigma, p.offset_lr, p.offset_tb, false);
	subplot(2,2,3)
	imagesc(render_hogimage(hog,50));
	colormap('gray');
	axis equal;
	subplot(2,2,2)
	img = negative_images(1);
	img_data = imread(['TrainImages/', img.name]);
	imagesc(img_data);
	colormap('gray');
	axis equal;
	hog = calculate_hoglike(img_data, p.cellsize, p.n_bins, p.sigma, p.offset_lr, p.offset_tb, false);
	subplot(2,2,4)
	imagesc(render_hogimage(hog,50));
	colormap('gray');
	axis equal;
    disp(a.hoglike_descriptor);

	% structures for images
	img = positive_images(1);
	img_data = imread(['TrainImages/', img.name]);
	hog = calculate_hoglike(img_data, p.cellsize, p.n_bins, p.sigma, p.offset_lr, p.offset_tb, false);
	[ny_bins, nx_bins, ~] = size(hog);
	vector_dimension = numel(hog);
	disp(['vector dimension is ', int2str(vector_dimension)]);
	
    if (~exist('positive_samples','var') || ~exist('positive_samples_ip','var'))
        positive_samples = zeros(size(positive_images,1),vector_dimension);
        if(p.use_interpolation)
            positive_samples_ip = zeros(size(positive_images,1),vector_dimension);
        end
        % read positive ...
        disp('loading positive samples');
        idx = 0;
        for img = positive_images'
            idx = idx + 1;
            % disp(idx);
            img_data = imread(['TrainImages/', img.name]);
            hog = calculate_hoglike(img_data, p.cellsize, p.n_bins, p.sigma, p.offset_lr, p.offset_tb, false);
            positive_samples(idx,:) = double(reshape(hog,1,vector_dimension));
            if(p.use_interpolation)
                hog_ip = calculate_hoglike(img_data, p.cellsize, p.n_bins, p.sigma, p.offset_lr, p.offset_tb, true);
                positive_samples_ip(idx,:) = double(reshape(hog_ip,1,vector_dimension));
            end
        end
        disp([int2str(size(positive_samples,1)),' positive samples loaded']);
    else
        disp('loading positives samples from cache, if you changed relevant parameters, use clear and rerun');
    end
    
	if (~exist('negative_samples','var') || ~exist('negative_samples_ip','var'))
        negative_samples = zeros(size(negative_images,1),vector_dimension);
        if(p.use_interpolation)
            negative_samples_ip = zeros(size(negative_images,1),vector_dimension);
        end
        % ... and negative images
        disp('loading negative samples');
        idx = 0;
        for img = negative_images'
            idx = idx + 1;
            % disp(idx);
            img_data = imread(['TrainImages/', img.name]);
            hog = calculate_hoglike(img_data, p.cellsize, p.n_bins, p.sigma, p.offset_lr, p.offset_tb, false);
            negative_samples(idx,:) = double(reshape(hog,1,vector_dimension));
            if(p.use_interpolation)
                hog_ip = calculate_hoglike(img_data, p.cellsize, p.n_bins, p.sigma, p.offset_lr, p.offset_tb, true);
                negative_samples_ip(idx,:) = double(reshape(hog_ip,1,vector_dimension));
            end
        end
        disp([int2str(size(negative_samples,1)),' negative samples loaded']);
	else
        disp('loading negative samples from cache, if you changed relevant parameters, use clear and rerun');
	end
	
	%train the SVM
	disp('training SVM');
	samples = [positive_samples; negative_samples];
    targets = [ repmat(p.car,size(positive_samples,1),1) ; repmat(p.no_car, size(negative_samples,1),1)];
    SVMStruct = fitcsvm(samples,targets);
    if(p.use_interpolation)
        samples_ip = [positive_samples_ip; negative_samples_ip];
        SVMStruct_ip = fitcsvm(samples_ip,targets);
    end

	% ===Test image===
    % image
	figure();
    title('single test image');
	img_data = imread('TestImages/test-5.pgm');
    subplot(3,4,1),	imagesc(img_data); 
    colormap('gray'), axis equal, title('image');
    
    % hog-image
	hog = calculate_hoglike(img_data, p.cellsize, p.n_bins, p.sigma, p.offset_lr, p.offset_tb, false);
	subplot(3,4,2),	imagesc(render_hogimage(hog, 50));
    colormap('gray'), axis equal, title('hog image');

    % score (wo nms)
	subplot(3,4,5),	hog_score = object_hypothesis(SVMStruct, hog, ny_bins, nx_bins);
	imagesc(hog_score),	colormap('gray'), axis equal, title('scores (wo nms)');
    
    % detections (wo nms)    
    subplot(3,4,9)
    [y,x,score] = detect_objects(hog_score, p.thresh);
	imagesc(img_data), colormap('gray'), axis equal;
	for i = 1:size(y,1)
		rectangle('Position', [x(i)*p.cellsize,y(i)*p.cellsize, nx_bins*p.cellsize, ny_bins*p.cellsize], 'EdgeColor', 'r');
		text(x(i)*p.cellsize + 1, y(i)*p.cellsize + 2, num2str(score(i)), 'Color', 'r');
    end
    
    disp(a.detector);
    
    if(p.use_nms)
        % score (with nms)
        score_nms = nms(hog_score);
        subplot(3,4,6), imagesc(score_nms,[min(min(hog_score)),max(max(hog_score))]);
        colormap('gray'), axis equal, title('scores (with nms)');
        
        %detections (with nms)
        subplot(3,4,10)
        [y,x,score] = detect_objects(score_nms, p.thresh);
        imagesc(img_data), colormap('gray'), axis equal;
        for i = 1:size(y,1)
            rectangle('Position', [x(i)*p.cellsize,y(i)*p.cellsize, nx_bins*p.cellsize, ny_bins*p.cellsize], 'EdgeColor', 'r');
            text(x(i)*p.cellsize + 1, y(i)*p.cellsize + 2, num2str(score(i)), 'Color', 'r');
        end
    end
    disp(a.nms);

    if(p.use_interpolation)
        % hog-image + ip
        hog_ip = calculate_hoglike(img_data, p.cellsize, p.n_bins, p.sigma, p.offset_lr, p.offset_tb, true);
        subplot(3,4,3),	imagesc(render_hogimage(hog_ip, 50));
        colormap('gray'), axis equal, title('hog image + ip');
        
        % score (with ip)
        score_ip = object_hypothesis(SVMStruct_ip, hog_ip, ny_bins, nx_bins);
        subplot(3,4,7), imagesc(score_ip,[min(min(score_ip)),max(max(score_ip))]);
        colormap('gray'), axis equal, title('scores (with ip, wo nms)');
        
        %detections (with nms)
        subplot(3,4,11)
        [y,x,score] = detect_objects(score_ip, p.thresh);
        imagesc(img_data), colormap('gray'), axis equal;
        for i = 1:size(y,1)
            rectangle('Position', [x(i)*p.cellsize,y(i)*p.cellsize, nx_bins*p.cellsize, ny_bins*p.cellsize], 'EdgeColor', 'r');
            text(x(i)*p.cellsize + 1, y(i)*p.cellsize + 2, num2str(score(i)), 'Color', 'r');
        end
        
        if(p.use_nms)
            % score (with nms+ip)
            score_nms_ip = nms(score_ip);
            subplot(3,4,8), imagesc(score_nms_ip,[min(min(score_ip)),max(max(score_ip))]);
            colormap('gray'), axis equal, title('scores (with ip + nms)');

            %detections (with nms+ip)
            subplot(3,4,12)
            [y,x,score] = detect_objects(score_nms_ip, p.thresh);
            imagesc(img_data), colormap('gray'), axis equal;
            for i = 1:size(y,1)
                rectangle('Position', [x(i)*p.cellsize,y(i)*p.cellsize, nx_bins*p.cellsize, ny_bins*p.cellsize], 'EdgeColor', 'r');
                text(x(i)*p.cellsize + 1, y(i)*p.cellsize + 2, num2str(score(i)), 'Color', 'r');
            end
        end
    end
    disp(a.bilinear_interpolation);
    
    for img_num = p.test_img_nums
        % ===Test image===
        % image
        figure();
        title('single test image');
        img_data = imread(sprintf('TestImages/test-%d.pgm',img_num));
        subplot(3,4,1),	imagesc(img_data); 
        colormap('gray'), axis equal, title('image');

        % hog-image
        hog = calculate_hoglike(img_data, p.cellsize, p.n_bins, p.sigma, p.offset_lr, p.offset_tb, false);
        subplot(3,4,2),	imagesc(render_hogimage(hog, 50));
        colormap('gray'), axis equal, title('hog image');

        % score (wo nms)
        subplot(3,4,5),	hog_score = object_hypothesis(SVMStruct, hog, ny_bins, nx_bins);
        imagesc(hog_score),	colormap('gray'), axis equal, title('scores (wo nms)');

        % detections (wo nms)    
        subplot(3,4,9)
        [y,x,score] = detect_objects(hog_score, p.thresh);
        imagesc(img_data), colormap('gray'), axis equal;
        for i = 1:size(y,1)
            rectangle('Position', [x(i)*p.cellsize,y(i)*p.cellsize, nx_bins*p.cellsize, ny_bins*p.cellsize], 'EdgeColor', 'r');
            text(x(i)*p.cellsize + 1, y(i)*p.cellsize + 2, num2str(score(i)), 'Color', 'r');
        end

        if(p.use_nms)
            % score (with nms)
            score_nms = nms(hog_score);
            subplot(3,4,6), imagesc(score_nms,[min(min(hog_score)),max(max(hog_score))]);
            colormap('gray'), axis equal, title('scores (with nms)');

            %detections (with nms)
            subplot(3,4,10)
            [y,x,score] = detect_objects(score_nms, p.thresh);
            imagesc(img_data), colormap('gray'), axis equal;
            for i = 1:size(y,1)
                rectangle('Position', [x(i)*p.cellsize,y(i)*p.cellsize, nx_bins*p.cellsize, ny_bins*p.cellsize], 'EdgeColor', 'r');
                text(x(i)*p.cellsize + 1, y(i)*p.cellsize + 2, num2str(score(i)), 'Color', 'r');
            end
        end

        if(p.use_interpolation)
            % hog-image + ip
            hog_ip = calculate_hoglike(img_data, p.cellsize, p.n_bins, p.sigma, p.offset_lr, p.offset_tb, true);
            subplot(3,4,3),	imagesc(render_hogimage(hog_ip, 50));
            colormap('gray'), axis equal, title('hog image + ip');

            % score (with ip)
            score_ip = object_hypothesis(SVMStruct_ip, hog_ip, ny_bins, nx_bins);
            subplot(3,4,7), imagesc(score_ip,[min(min(score_ip)),max(max(score_ip))]);
            colormap('gray'), axis equal, title('scores (with ip, wo nms)');

            %detections (with nms)
            subplot(3,4,11)
            [y,x,score] = detect_objects(score_ip, p.thresh);
            imagesc(img_data), colormap('gray'), axis equal;
            for i = 1:size(y,1)
                rectangle('Position', [x(i)*p.cellsize,y(i)*p.cellsize, nx_bins*p.cellsize, ny_bins*p.cellsize], 'EdgeColor', 'r');
                text(x(i)*p.cellsize + 1, y(i)*p.cellsize + 2, num2str(score(i)), 'Color', 'r');
            end

            if(p.use_nms)
                % score (with nms+ip)
                score_nms_ip = nms(score_ip);
                subplot(3,4,8), imagesc(score_nms_ip,[min(min(score_ip)),max(max(score_ip))]);
                colormap('gray'), axis equal, title('scores (with ip + nms)');

                %detections (with nms+ip)
                subplot(3,4,12)
                [y,x,score] = detect_objects(score_nms_ip, p.thresh);
                imagesc(img_data), colormap('gray'), axis equal;
                for i = 1:size(y,1)
                    rectangle('Position', [x(i)*p.cellsize,y(i)*p.cellsize, nx_bins*p.cellsize, ny_bins*p.cellsize], 'EdgeColor', 'r');
                    text(x(i)*p.cellsize + 1, y(i)*p.cellsize + 2, num2str(score(i)), 'Color', 'r');
                end
            end
        end
    end
