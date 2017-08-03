/// @description Grid update notification

var has_water = scr_can_draw_from_grid(id, macro_grid_water);
var has_power = scr_can_draw_from_grid(id, macro_grid_electric);

image_index = (has_water) + (has_power*2);

if(has_water && has_power)
{
	is_active = true;
	image_index = 4;
}
else
{
	is_active = false;
}