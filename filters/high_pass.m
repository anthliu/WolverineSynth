function filter = high_pass(cutoff, signal)
    N = length(signal);

    %%%%

    cutoff = round(cutoff * N / 8192 + 1);

    z = fft(signal);
    z(1:cutoff) = 0;
    z(end - cutoff:end) = 0;

    filter = real(ifft(z));
end
