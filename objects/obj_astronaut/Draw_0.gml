draw_sprite(spr_shadow, 0, x, y);

event_inherited();

if(owner == macro_player)
{
	if(current_action == astronaut_action.constructing)
	{
		var completion = construction[? construction_completion];
		draw_healthbar(x-16, y-24, x+16, y-20, completion, c_black, c_yellow, c_yellow, 0, true, true);
		
		// draw construction laser beam
		draw_set_colour(c_aqua);
		switch(move_dir)
		{
			case macro_up:
				draw_sprite_ext(spr_construction_beam, 0, x + 6, y - 7, 1, 1, 0, c_white, 1);
				break;
			case macro_down:
				draw_sprite_ext(spr_construction_beam, 0, x - 6, y + 8, 1, 1, 180, c_white, 1);
				break;
			case macro_left:
				draw_sprite_ext(spr_construction_beam, 0, x - 10, y + 2, 1, 1, 90, c_white, 1);
				break;
			case macro_right:
				draw_sprite_ext(spr_construction_beam, 0, x + 10, y + 1, 1, 1, 270, c_white, 1);
				break;
		}
	}
	
	if(wears_suit) 	// draw oxygen bar
	{
		draw_healthbar(x - 12, y - 13, x + 12, y - 11, suit_oxygen, c_black, oxygen_bar_color, oxygen_bar_color, 0, true, true);
	}

	// draw autotask icon
	if(autotasking)
	{
		switch(current_action)
		{
			case astronaut_action.constructing:	
			case astronaut_action.fetching_mdu:
			case astronaut_action.moving_to_construction:
			case astronaut_action.delivering_mdu:
				draw_sprite(spr_auto_construct_small, 1, x, y);
				break;
			case astronaut_action.moving_to_shoot:
			case astronaut_action.in_combat:
				draw_sprite(spr_auto_attack_small, 1, x, y);
				break;
			case astronaut_action.executing_assignment:
				if(assigned_object.object_index == obj_bed) draw_sprite(spr_auto_sleep_small, 1, x, y);
				else if(assigned_object.object_index == obj_fridge) draw_sprite(spr_auto_feed_small, 1, x, y);
				break;
			case astronaut_action.idle:
			case astronaut_action.moving_by_command:
				autotasking = false;
				break;
		}
	}
}