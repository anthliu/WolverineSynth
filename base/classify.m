function freqs = classify(signal, Fs, thresh)
    candidates = 440 * 2.^[-2:1/12:2];

    N = length(signal);

    spect = abs(fft(Fs));
    spectro = spect(1:end/2);

    scores = [];
    for cand = candidates
        c_mean = cand * N / Fs + 1;
        c_dev = 0.008 * cand * N / Fs + 1;
        score = normpdf([1:N / 2], c_mean, c_dev);
        scores = [scores score];
    end

    freqs = candidates(scores > thresh);
end
