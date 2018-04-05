/// @description Grid update notification
var grid_props = grid_props_map[? macro_grid_electric];
if(scr_can_draw_power(id))
{
	if(image_index < 16)
	{
		image_index += 16;
	}
}
else	// low power
{
	if(image_index > 16)
	{
		image_index -= 16;
	}
}