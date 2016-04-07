function [] = update_plot(note_list)
    freqs = [];
    for nts = note_list
        freqs = [freqs nts.freq];
    end
    notes = 4 + 12 * log2(freqs / 440);
    stem(notes, 'filled');
    axis([0 length(freqs) + 1 0 12]);
end
