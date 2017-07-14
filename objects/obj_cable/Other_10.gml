/// @description set the is_active boolean here
var grid_props = grid_props_map[? macro_grid_electric];
if(scr_can_draw_power(id))
{
	is_active = true;
	grid_props[@macro_grid_component_active] = true;
	if(image_index mod 2 == 0)
	{
		image_index += 1;
	}
}
else	// low power
{
	is_active = false;
	grid_props[@macro_grid_component_active] = false;
	if(image_index mod 2 == 1)
	{
		image_index -= 1;
	}
}