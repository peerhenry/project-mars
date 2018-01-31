event_inherited();

// Plants and sprinklers must be drawn on top of object
if(!under_construction)
{
	// Draw food
	var food_image = floor(food_level/25);
	if(food_image >= 0)
	{
		draw_sprite(spr_hydroponics_plants, food_image, x, y);
	}
	
	// Draw sprinklers
	if(scr_can_draw_from_grid(id, macro_grid_water))
	{
		draw_sprite(spr_hydroponics_sprinklers, image_index, x, y);
	}
	else
	{
		draw_sprite(spr_hydroponics_sprinklers_off, image_index, x, y);
	}
}

// Assigned icon must be drawn on top
if(is_assigned)
{
	frame_counter++;
	if(frame_counter == frames)
	{
		frame_counter = 0;
		i_index = (i_index + 1) mod 4;
	}
	draw_sprite(spr_assigned, i_index, x, y);
}