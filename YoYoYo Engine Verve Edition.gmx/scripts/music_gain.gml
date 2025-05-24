/// music_gain(gain)

// Sets the gain for the current ID playing.
var gain = argument0;

if (global.currentMusicID != -1) {
    audio_sound_gain(global.currentMusic, gain, 0);
}
