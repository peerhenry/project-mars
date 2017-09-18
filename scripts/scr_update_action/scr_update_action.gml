/// @arg astronaut
debug_instance_inherits(argument0, obj_astronaut);
var arg_astronaut = argument0;

with(arg_astronaut)
{
	switch(current_action)
	{
		case astronaut_action.constructing:
			var completion = construction[? construction_completion] + 100/(30*construction[? construction_time]);
			ds_map_replace(construction, construction_completion, completion);
			if(construction[? construction_completion] >= 100)
			{
				scr_build_complete(construction);
			}
			break;
		case astronaut_action.moving_to_target:
			var within_range = scr_target_is_within_range(id, target);
			var no_obstructions = scr_can_shoot_unobstructed(id, target);
			if(within_range && no_obstructions)
			{
				// move to nearest cell towards target
				var dir = scr_get_direction_from_to(id, target);
				var ij = scr_get_adjacent_cell_in_direction(occ_i, occ_j, dir);
				var dest_x = scr_ij_to_x(ij);
				var dest_y = scr_ij_to_y(ij);
				var can_do = scr_navigate(id, dest_x, dest_y);
				if(can_do) current_action = astronaut_action.moving_to_shoot;
				else {
					current_action = astronaut_action.idle;
					scr_cancel_walking(id);
				}
			}
			break;
		case astronaut_action.in_combat:
			if(target == noone && auto_target == noone) current_action = astronaut_action.idle;
			break;
	}
}