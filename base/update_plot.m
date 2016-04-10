function [] = update_plot(note_list)
    max_beats = 20;
    freqs = [];
    times = 0;
    for nts = note_list
        freqs = [freqs nts.freq];
        times = [times times(end)+nts.beats];
    end

    if (length(times) == 1)
        notes = -4
        times = 0;
    else
        times(end) = [];
        notes = 4 + 12 * log2(freqs / 440);
    end


    stem(times, notes, 'filled');
    if (times(end) < 20)
        axis([-1 21 0 12]);
    else
        axis([times(end) - 21 times(end)+1 0 12]);
    end
end
