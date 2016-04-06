function freqs = classify(signal, Fs)
    min_freq = 40;
    max_freq = 10000;

    N = length(signal);
    if (mod(N, n) * Fs / N) < 10000)
        max_freq = mod(N, n) * Fs / N;
    end
    spect = abs(fft(Fs));
end
