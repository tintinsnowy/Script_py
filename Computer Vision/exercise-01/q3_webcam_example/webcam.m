function vidObj = webcam()
	% see "Image Acquisition Toolbox"
	% useful command: 
	% >> imaqtool
	% look up your cam settings in a gui
	% (can generate a m-file which sets up the cam)

	% Device Properties (use imaqtool to find the right vidFormat for your camera)
	if ispc
		% Windows
		adaptorName = 'winvideo';
		vidFormat = 'I420_320x240';
	else
		% Linux 
		adaptorName = 'linuxvideo';
		vidFormat = 'YUYV_320x240';
	end

	vidObj = videoinput(adaptorName, 1, vidFormat);
	set(vidObj, 'ReturnedColorSpace', 'grayscale');
	set(vidObj, 'FramesPerTrigger', 1);

end
