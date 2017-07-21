/// @description Grid has updated
if(scr_can_draw_power(id))
{
	scr_get_grid_prop(id, macro_grid_electric, macro_grid_component_can_perform_role);
	//[@macro_grid_component_can_perform_role]
	image_speed = 1;
}
else	// low power
{
	image_index = 0;
	image_speed = 0;
}