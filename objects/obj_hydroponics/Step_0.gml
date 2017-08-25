if(scr_can_draw_from_grid(id, macro_grid_water) && food_level < 100)
{
	food_level += 0.1;
	if(food_level > 100)
	{
		food_level = 100;
	}
}