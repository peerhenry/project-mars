show_debug_message("Saving settings file: " + macro_settings_file);

var settings = global.settings;

ini_open(macro_settings_file);

// -- section: window --
var section = "window";
var window = global.window;
settings[? key_settings_window_width] = window[? key_window_width];
settings[? key_settings_window_height] = window[? key_window_height];
settings[? key_settings_window_fullscreen] = window[? key_window_fullscreen];
settings[? key_settings_window_aa_level] = window[? key_window_aa_level];
settings[? key_settings_window_vsync] = window[? key_window_vsync];
//settings[? key_settings_window_x] = window[? key_window_x];
//settings[? key_settings_window_y] = window[? key_window_y];
ini_write_real(section, "width", settings[? key_settings_window_width]);
ini_write_real(section, "height", settings[? key_settings_window_height]);
ini_write_real(section, "fullscreen", settings[? key_settings_window_fullscreen]);
ini_write_real(section, "aa_level", settings[? key_settings_window_aa_level]);
ini_write_real(section, "vsync", settings[? key_settings_window_vsync]);
//ini_write_real(section, "window_x", settings[? key_settings_window_x]);
//ini_write_real(section, "window_y", settings[? key_settings_window_y]);

// -- section: sound --
section = "sound";
ini_write_real(section, "master", settings[? key_settings_sound_volume_master]);
ini_write_real(section, "voice", settings[? key_settings_sound_volume_voice]);
ini_write_real(section, "sfx", settings[? key_settings_sound_volume_sfx]);
ini_write_real(section, "music", settings[? key_settings_sound_volume_music]);

ini_close();