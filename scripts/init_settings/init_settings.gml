/// @description Settings initializer called at boot only

if(file_exists(macro_settings_file))
{
	if(true) //reinitialize settings
	{
		scr_force_trace("Reinitializing settings file: " + macro_settings_file);
		file_delete(macro_settings_file);
	}
	else scr_force_trace("Using settings file: " + macro_settings_file);
}

settings = ds_map_create();

ini_open(macro_settings_file);
settings[? "window_width"] = ini_read_real("settings", "width", macro_init_window_width);
settings[? "window_height"] = ini_read_real("settings", "height", macro_init_window_height);
settings[? "window_fullscreen"] = ini_read_real("settings", "fullscreen", macro_init_window_fullscreen);
settings[? "window_aa_level"] = ini_read_real("settings", "aa_level", macro_init_window_aa_level);
settings[? "window_vsync"] = ini_read_real("settings", "vsync", macro_init_window_vsync);
settings[? "volume_master"] = ini_read_real("sound", "master", macro_master_default);
settings[? "volume_voice"] = ini_read_real("sound", "voice", macro_voice_default);
settings[? "volume_sfx"] = ini_read_real("sound", "sfx", macro_sfx_default);
settings[? "volume_music"] = ini_read_real("sound", "music", macro_music_default);
ini_close();

global.settings = settings;