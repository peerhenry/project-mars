event_inherited();

// Plants and sprinklers must be drawn on top of object
if(!under_construction)
{
	// Draw food
	var food_image = floor( 4*food_level/100 ) - 1;
	if(food_image >= 0)
	{
		draw_sprite(spr_hydroponics_plants, food_image, x, y);
	}
	
	// Draw sprinklers
	if(!scr_can_draw_from_grid(id, macro_grid_water) || food_image == 3)
	{
		draw_sprite(spr_hydroponics_sprinklers_off, image_index, x, y);
	}
	else draw_sprite(spr_hydroponics_sprinklers, image_index, x, y); 
}