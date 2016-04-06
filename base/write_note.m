function out = write_note(note, timesig)
    t = [1:note.beats * (60 / timesig.tempo) * timesig.Fs] / timesig.Fs;
    out = 0;

    for freq = note.freq
        fm = note.timbre * cos(2 * pi * freq * ...
            2.^[0:length(note.timbre) - 1]' * t);
        vib = note.vib_amp * cos(2 * pi * note.vib_freq * t);
        cur_out = cos(2 * pi * freq * t + fm + vib);
        cur_out = note.scale * note.env(t) .* note.filter(cur_out);
        out = out + cur_out;
    end
end
