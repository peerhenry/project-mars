if(current_action == astronaut_action.constructing)
{
	var completion = construction[? construction_completion];
	draw_healthbar(x-16, y-24, x+16, y-20, completion, c_black, c_yellow, c_yellow, 0, true, true);
}

event_inherited();

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