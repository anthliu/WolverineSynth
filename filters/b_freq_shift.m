function filter = b_freq_shift(shift, signal)
    N = length(signal);

    z = fft(signal);
    z([1 end]) = 0;
    zs = z(1:floor(end / 2));
    zs(shift + 1:end) = zs(1:end - shift);
    zs(1:shift) = 0;

    z(1:floor(end / 2)) = zs;
    z(ceil(end / 2) + 1:end) = fliplr(zs);

    filter = real(ifft(z));
end
