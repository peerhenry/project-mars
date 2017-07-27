ini_open(macro_settings_file);
if(slider.percentage != ini_read_real("sound", "sfx", 100))
{
	ini_write_real("sound", "sfx", slider.percentage);
}
ini_close();