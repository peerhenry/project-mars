with(obj_dropdown)
{
	text = other.text;
	// select event
	
	ini_open("game_settings.ini");
	ini_write_real("settings", "width", other.width);
	ini_write_real("settings", "height", other.height);
	ini_close();
	scr_resolution(other.width, other.height);
}
with(obj_dropdown_item)
{
	instance_destroy();
}