if(scr_can_draw_power(id))
{
	grid_props[@macro_grid_component_active] = true;
	if(next_carrier.image_index mod 2 == 0)
	{
		image_index += 1;
	}
}
else	// low power
{
	grid_props[@macro_grid_component_active] = false;
	if(next_carrier.image_index mod 2 == 1)
	{
		image_index -= 1;
	}
}