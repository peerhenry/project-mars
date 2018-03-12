draw_sprite(spr_shadow, 0, x, y);

event_inherited();

if(owner == macro_player)
{
	if(current_action == astronaut_action.constructing)
	{
		var completion = construction[? construction_completion];
		draw_healthbar(x-16, y-24, x+16, y-20, completion, c_black, c_yellow, c_yellow, 0, true, true);
	}
	
	if(wears_suit) 	// draw oxygen bar
	{
		draw_healthbar(x - 12, y - 13, x + 12, y - 11, suit_oxygen, c_black, oxygen_bar_color, oxygen_bar_color, 0, true, true);
	}

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