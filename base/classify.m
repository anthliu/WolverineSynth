function freqs = classify(signal, Fs, thresh)
    candidates = 440 * 2.^[-3:1/12:4];

    N = length(signal);

    spect = abs(fft(signal));
    spectro = spect(1:end / 2);

    scores = [];
    for cand = candidates
        c_mean = cand * N / Fs + 1;
        %c_dev = 0.008 * cand * N / Fs + 1;
        c_dev = N / Fs;
        score = c_dev * normpdf([1:N / 2], c_mean, c_dev) * spectro';
        scores = [scores score];
    end

    freqs = candidates(scores > thresh);
    %plot([0:N/2 - 1] * Fs / N, spectro)
end
