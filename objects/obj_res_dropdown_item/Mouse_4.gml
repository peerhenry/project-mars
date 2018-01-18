with(obj_res_dropdown)
{
	text = other.text;
	// select event
	
	ini_open(macro_settings_file);
	ini_write_real("settings", "width", other.width);
	ini_write_real("settings", "height", other.height);
	ini_close();
	scr_resolution(other.width, other.height);
}
with(obj_res_dropdown_item)
{
	instance_destroy();
}