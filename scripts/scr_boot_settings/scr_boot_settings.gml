/// @description Settings initializer called at boot only

if(file_exists(macro_settings_file))
{
	var reset = file_exists("reset_settings.flag");
	if(reset) //reset settings
	{
		show_debug_message("Resetting settings file: " + macro_settings_file);
		file_delete(macro_settings_file);
	}
	else show_debug_message("Loading settings file: " + macro_settings_file);
}
else show_debug_message("Creating settings file: " + macro_settings_file);

var settings = ds_map_create();

ini_open(macro_settings_file);
settings[? key_settings_creation_date] = init_global_real("settings", "creation_date", scr_date_format(date_current_datetime()));
settings[? key_settings_window_width] = init_global_real("window", "width", default_window_width);
settings[? key_settings_window_height] = init_global_real("window", "height", default_window_height);
settings[? key_settings_window_fullscreen] = init_global_real("window", "fullscreen", default_window_fullscreen);
settings[? key_settings_window_aa_level] = init_global_real("window", "aa_level", default_window_aa_level);
settings[? key_settings_window_vsync] = init_global_real("window", "vsync", default_window_vsync);
settings[? key_settings_window_x] = init_global_real("window", "display_x", default_window_x);
settings[? key_settings_window_y] = init_global_real("window", "display_y", default_window_y);
settings[? key_settings_sound_volume_master] = init_global_real("sound", "volume_master", default_sound_volume_master);
settings[? key_settings_sound_volume_voice] = init_global_real("sound", "volume_voice", default_sound_volume_voice);
settings[? key_settings_sound_volume_sfx] = init_global_real("sound", "volume_sfx", default_sound_volume_sfx);
settings[? key_settings_sound_volume_music] = init_global_real("sound", "volume_music", default_sound_volume_music);
ini_close();

global.settings = settings;