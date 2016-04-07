function env = pow_gen(pow, lt)
    env = @(t) linspace(1, lt, length(t)) .^ pow;
end
