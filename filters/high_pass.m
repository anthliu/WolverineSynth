function filter = low_pass(cutoff, signal, Fs)
    L = length(signal);

    %%%%

    hsupp = (-(L-1)/2:(L-1)/2);
    hideal = (2*cutoff/Fs)*sinc(2*cutoff*hsupp/Fs);
    h = hamming(L)' .* hideal;

    %%%%

    %plot(abs(1 - fft(h)));

    z = fft(signal);
    z(1:cutoff) = 0;
    z(end - cutoff:end) = 0;

    plot(abs(z));

    filter = real(ifft(z));
end
