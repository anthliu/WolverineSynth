function signal = imagetosignal(path, format)
    % Read in the image and make it symmetric.
    im = imread(path, format);
    im = flipdim(im, 1);
    im = [im; flipud(im)];
    [row, column, numberOfColorChannels] = size(im);
    signal = [];

    % Take the ifft of each column of pixels and piece together the results.
    for i = 1 : column
    	spectrogramWindow = im(:, i);
        spectrogramWindow = spectrogramWindow(1:3:end);
    	signalWindow = real(ifft(spectrogramWindow));
        signalWindow = signalWindow(1:floor(end/2));
    	signal = [signal; signalWindow];
    end
    whos
end
