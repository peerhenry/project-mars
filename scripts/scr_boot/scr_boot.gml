/// @description The very first script to run on startup

global.enable_trace = debug_mode;
global.dev_env = true;
//show_debug_message("working_directory: " + string(working_directory));

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
// monitor width and height may not be supported by game...

#region Read settings

ini_open(macro_settings_file);
var settings_width = ini_read_real("settings", "width", 1024);
var settings_height = ini_read_real("settings", "height", 768);
var volume_master = ini_read_real("sound", "master", macro_master_default);
var volume_voice = ini_read_real("sound", "voice", macro_voice_default);
var volume_sfx = ini_read_real("sound", "sfx", macro_sfx_default);
var volume_music = ini_read_real("sound", "music", macro_music_default);
var fullscreen = ini_read_real("settings", "fullscreen", false);
ini_close();

#endregion

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

global.active_constructions = ds_list_create();

// Skirmish/level settings
var skirmish_settings = ds_map_create();
ds_map_add(skirmish_settings, macro_skirmish_victory_condition, victory.domination);
ds_map_add(skirmish_settings, macro_skirmish_astro_count, 5);
ds_map_add(skirmish_settings, macro_skirmish_mdu_pile_count, 4);

global.skirmish_settings = skirmish_settings;
global.level_object_index = noone;
global.mission_accomplished_return_room = room_menu;
global.mission_failed_return_room = room_menu;
global.mission_control_site = noone; // used to flag when mission accomplished
global.next_level = 1;
global.last_level_index = 6;