/// @description set the is_active boolean here
var grid_props = grid_props_map[? macro_grid_electric];
if(scr_can_draw_power(id))
{
	if(image_index mod 2 == 0)
	{
		image_index += 1;
	}
}
else	// low power
{
	if(image_index mod 2 == 1)
	{
		image_index -= 1;
	}
}