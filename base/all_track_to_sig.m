function sig = all_track_to_sig(cumul, tm)
{
    sig = 0;
    for track = 1:length(cumul)
        cur_sig = [];
        for note = cumul{track}
            cur_sig = [sig write_note(note, tm)];
        end
        sig = sig + cur_sig;
    end
}
