function env = adsr_gen(attack, decay, sustain)
    % generate ADSR lambda function
    % ADSR - attack decay sustain release
    pad_it = @(arr, low, high) linspace(low, high, length(arr));
    pos = @(perc, t) round(perc * length(t));

    env = @(t) [pad_it(t(1:pos(attack(1), t)), 0, attack(2))...
        pad_it(t(pos(attack(1), t) + 1 : pos(decay(1), t)), attack(2), decay(2))...
        pad_it(t(pos(decay(1), t) + 1 : pos(sustain(1), t)), decay(2), sustain(2))...
        pad_it(t(pos(sustain(1), t) + 1 : end), sustain(2), 0)];
end
