ini_open(macro_settings_file);
if(slider.percentage != ini_read_real("sound", "music", 100))
{
	ini_write_real("sound", "music", slider.percentage);
}
ini_close();