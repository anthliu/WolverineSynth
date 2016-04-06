function [note] = def_note()
    note.name = 'a';
    note.freq = 440;
    note.beats = 1;
    note.instrument = 'piano';

    note.vib_freq = 5;
    note.vib_amp = 0;

    note.timbre = [0];

    note.scale = 0.5;%how loud is the sound
    note.env = @(t) ones(size(t));%envelope for sound
    note.filter = @(sig) sig;
end
