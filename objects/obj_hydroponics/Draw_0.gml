event_inherited();

// Plants and sprinklers must be drawn on top of object
if(!under_construction && is_active)
{
	var food_image = floor(food_level/20) -1;
	if(food_image >= 0)
	{
		draw_sprite(spr_hydroponics_plants, food_image, x, y);
	}
	
	draw_sprite(spr_hydroponics_sprinklers, image_index, x, y);
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