function a = answers()
	a.hu_moments = 'Textual answer to hu moments.';
    p2p = imread('pap1.png');
    %p2p_otsu = thresh_otsu(p2p);
    %p2p_niblack=thresh_niblack(p2p, 15, -0.2);
    p2p_otsu=thresh_niblack(p2p, 5, -0.2);
    %morphological
    structure_square = strel('square', 5); % 5-by-5 square
    structure_line = strel('line', 10, 45); % line, length 10, angle 45
    structure_disk = strel('disk', 1); % disk, radius 1
    
    p2p_dilated1 = imdilate(p2p_otsu, structure_square);
    p2p_eroded1 = imerode(p2p_otsu, structure_square);
    p2p_opened1 = imopen(p2p_otsu, structure_square);
    p2p_closed1 = imclose(p2p_otsu, structure_square);

    p2p_dilated2 = imdilate(p2p_otsu, structure_line);
    p2p_eroded2 = imerode(p2p_otsu, structure_line);
    p2p_opened2 = imopen(p2p_otsu, structure_line);
    p2p_closed2 = imclose(p2p_otsu, structure_line);

    p2p_dilated3 = imdilate(p2p_otsu, structure_disk);
    p2p_eroded3 = imerode(p2p_otsu, structure_disk);
    p2p_opened3 = imopen(p2p_otsu, structure_disk);
    p2p_closed3 = imclose(p2p_otsu, structure_disk);

    figure('Position', [200, 400, 800, 600]); 
    subplot(3, 4, 1);
    imshow(p2p_dilated1);
    title('dilated with square');

    subplot(3, 4, 2);
    imshow(p2p_eroded1);
    title('eroded with square');

    subplot(3, 4, 3);
    imshow(p2p_opened1);
    title('opened with square');

    subplot(3, 4, 4);
    imshow(p2p_closed1);
    title('closed with square');

    subplot(3, 4, 5);
    imshow(p2p_dilated2);
    title('dilated with line');

    subplot(3, 4, 6);
    imshow(p2p_eroded2);
    title('eroded with line');

    subplot(3, 4, 7);
    imshow(p2p_opened2);
    title('opened with line');

    subplot(3, 4, 8);
    imshow(p2p_closed2);
    title('closed with line');

    subplot(3, 4, 9);
    imshow(p2p_dilated3);
    title('dilated with disk');

    subplot(3, 4, 10);
    imshow(p2p_eroded3);
    title('eroded with disk');

    subplot(3, 4, 11);
    imshow(p2p_opened3);
    title('opened with disk');

    subplot(3, 4, 12);
    imshow(p2p_closed3);
    title('closed with disk');
    
    figure;
    L = bwlabel(p2p_eroded1);
    imshow(L);
    
end
