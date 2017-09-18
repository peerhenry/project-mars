/// @param astronaut
var arg_attacker = argument0;
debug_instance_inherits(arg_attacker, obj_astronaut);

var can_pursue = false;

with(arg_attacker)
{
	// calculate tile from which attacker will shoot
	var dx = target.x - x;
	var dy = target.y - y;

	var distance = sqrt(dx*dx + dy*dy);
	var shooting_range = scr_get_shooting_range(arg_attacker);
	if(distance < global.shooting_range) exit;

	var fraction = (1 - global.shooting_range/distance);
	var in_range_x = dx*fraction;
	var in_range_y = dy*fraction;
	var dir = scr_get_approximate_direction(dx, dy);
	var dest_ij = scr_get_adjacent_cell_in_direction(scr_rc_to_gi(in_range_x), scr_rc_to_gi(in_range_y), dir);
	var dest_i = scr_decode_grid_coord_i(dest_ij);
	var dest_j = scr_decode_grid_coord_j(dest_ij);
	var dest_x = scr_gi_to_rc(dest_i);
	var dest_y = scr_gi_to_rc(dest_j);

	// try to navigate to that tile
	var can_navigate_to_shoot = scr_navigate(id, dest_x, dest_y);
	if(can_navigate_to_shoot)
	{
		current_action = astronaut_action.moving_to_shoot;
		can_pursue = true;
	}
	else
	{
		// if not possible, navigate to target directly
		var can_navigate_to_target = scr_navigate(id, target.x, target.y);
		if(can_navigate_to_target)
		{
			current_action = astronaut_action.moving_to_target;	
			can_pursue = true;
		}
	}
}

return can_pursue;