function filter = low_pass(cutoff, signal)
    N = length(signal);

    %%%%
    
    cutoff = round(cutoff * N / 8192 + 1);

    z = fft(signal);
    z(cutoff:end - cutoff) = 0;

    filter = real(ifft(z));
end
