ini_open(macro_settings_file);
if(slider.percentage != ini_read_real("sound", "master", 100))
{
	ini_write_real("sound", "master", slider.percentage);
}
ini_close();