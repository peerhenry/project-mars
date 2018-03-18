event_inherited();

ini_open(macro_settings_file);
ini_write_real("settings", "fullscreen", checked);
ini_close();
window_set_fullscreen(checked);
global.window_fullscreen = checked;