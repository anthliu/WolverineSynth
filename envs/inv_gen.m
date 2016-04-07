function env = inv_gen(lt)
    env = @(t) 1./linspace(1, lt, length(t));
end
