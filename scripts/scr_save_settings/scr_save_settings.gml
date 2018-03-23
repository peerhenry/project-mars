show_debug_message("Saving settings file: " + macro_settings_file);

ini_open(macro_settings_file);

// -- section: window --
ini_write_real("window", "width", settings[? key_settings_window_width]);
ini_write_real("window", "height", settings[? key_settings_window_height]);
ini_write_real("window", "fullscreen", settings[? key_settings_window_fullscreen]);
ini_write_real("window", "aa_level", settings[? key_settings_window_aa_level]);
ini_write_real("window", "vsync", settings[? key_settings_window_vsync]);
//ini_write_real("window", "window_x", settings[? key_settings_window_x]);
//ini_write_real("window", "window_y", settings[? key_settings_window_y]);

// -- section: sound --
var ini_volume_master = ini_read_real("sound", "master", default_sound_volume_master);
var ini_volume_voice = ini_read_real("sound", "voice", default_sound_volume_voice);
var ini_volume_sfx = ini_read_real("sound", "sfx", default_sound_volume_sfx);
var ini_volume_music = ini_read_real("sound", "music", default_sound_volume_music);

var volume_master = round(audio_get_master_gain(0)*100);
var volume_voice = global.voice_volume;
var volume_sfx = global.sfx_volume;
var volume_music = global.music_volume;

if(volume_master != ini_volume_master) ini_write_real("sound", "voice", volume_master);
if(volume_voice != ini_volume_voice) ini_write_real("sound", "voice", volume_voice);
if(volume_sfx != ini_volume_sfx) ini_write_real("sound", "sfx", volume_sfx);
if(volume_music != ini_volume_music) ini_write_real("sound", "music", volume_music);

ini_close();