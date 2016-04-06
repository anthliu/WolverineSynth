function env = pois_gen(tp)
    pois = @(t) arrayfun(@(x) (x.^tp) ./ exp(x), [1:length(t)] / (length(t) / (3 * tp)));
    env = @(t) (pois(t)) / max(pois(t));
end
