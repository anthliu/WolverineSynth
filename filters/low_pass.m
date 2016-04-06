function filter = low_pass(cutoff, signal, Fs)
    L = length(signal);

    %%%%

    hsupp = (-(L-1)/2:(L-1)/2);
    hideal = (2*cutoff/Fs)*sinc(2*cutoff*hsupp/Fs);
    h = hamming(L)' .* hideal;

    %%%%
    plot(abs(fft(h)));

    filter = real(ifft(fft(signal) .* fft(h)));
end
