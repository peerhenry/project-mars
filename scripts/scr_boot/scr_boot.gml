/// @description The very first script to run on startup

// Set cursor sprite
cursor_sprite = spr_cursor;
global.room_is_transitioning = false;

// # load audio groups
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);
audio_group_load(audiogroup_voice);

#macro macro_settings_file "game_settings.ini"
#macro macro_master_default 80
#macro macro_voice_default 50
#macro macro_sfx_default 100
#macro macro_music_default 100

var monitor_width = display_get_width();
var monitor_height = display_get_height();
global.monitor_width = monitor_width;
global.monitor_height = monitor_height;

// Read settings
ini_open(macro_settings_file);

var settings_width = ini_read_real("settings", "width", monitor_width);
var settings_height = ini_read_real("settings", "height", monitor_height);

var volume_master = ini_read_real("sound", "master", macro_master_default);
var volume_voice = ini_read_real("sound", "voice", macro_voice_default);
var volume_sfx = ini_read_real("sound", "sfx", macro_sfx_default);
var volume_music = ini_read_real("sound", "music", macro_music_default);
var fullscreen = ini_read_real("settings", "fullscreen", false);

ini_close();

// Set resolution
scr_resolution(settings_width, settings_height);
window_set_fullscreen(fullscreen);
window_center();
global.fullscreen = fullscreen;

// Set audio levels
audio_master_gain(volume_master/100);
audio_group_set_gain(audiogroup_voice, volume_voice/100, 0);
audio_group_set_gain(audiogroup_sfx, volume_sfx/100, 0);
audio_group_set_gain(audiogroup_music, volume_music/100, 0);
global.music_volume = volume_music;
global.sfx_volume = volume_sfx;
global.voice_volume = volume_voice;