/// @description Grid update notification
var grid_props = grid_props_map[? macro_grid_electric];
var can_draw_power = resolve_execute(script_container, "can_draw_power", id);
if(can_draw_power)
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