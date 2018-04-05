/// @param cable_instance
var arg_cable = argument0;

with(arg_cable)
{
	image_index = cable_adjacency;
	if(cable_adjacency == 0) image_index = 5;
	if(scr_can_draw_from_grid(arg_cable, macro_grid_electric))
	{
		image_index += 16;
	}
}