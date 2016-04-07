function [] = update_plot(note_list)
    max_notes = 20;
    freqs = [];
    for nts = note_list
        freqs = [freqs nts.freq];
    end
    notes = 4 + 12 * log2(freqs / 440);
    if length(notes) > 20
        p_notes = notes(end - 19: end);
    else
        p_notes = notes;
    end
    stem(p_notes, 'filled');
    axis([0 21 0 12]);
end
