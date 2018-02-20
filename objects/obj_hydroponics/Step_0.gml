if(scr_can_draw_from_grid(id, macro_grid_water) && food_level < 100)
{
	food_level += 0.04;
	if(food_level > 100)
	{
		food_level = 100;
	}
}
event_inherited();