function env = hanning_gen()
    env = @(t) hanning(length(t))';
end
