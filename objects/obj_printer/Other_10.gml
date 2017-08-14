/// @description Grid update notification

var has_power = scr_can_draw_from_grid(id, macro_grid_electric);

if(has_power)
{
	is_active = true;
	image_index = 1;
}
else
{
	is_active = false;
}