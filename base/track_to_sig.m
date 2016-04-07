function signal = track_to_sig(note_list, tm)
    signal = [];
    for note = note_list
        signal = [signal write_note(note, tm)];
end
