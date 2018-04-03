/// @param astronaut
var arg_attacker = argument0;
debug_instance_inherits(arg_attacker, obj_astronaut);

var can_pursue = false;

// calculate tile from which attacker will shoot
with(arg_attacker)
{
	var dx = target.x - x;
	var dy = target.y - y;
	var distance = sqrt(dx*dx + dy*dy);
	var shooting_range_pixels = scr_get_shooting_range(id)*32;
	
	// determine the fraction of current distance the attacker has to move to get into shooting range
	var fraction = 1;
	if(distance < shooting_range_pixels) fraction = 0;
	else fraction = (1 - (shooting_range_pixels/distance));
	
	var in_range_dx = dx*fraction;
	var in_range_dy = dy*fraction;
	var in_range_x = x + in_range_dx;
	var in_range_y = y + in_range_dy;
	var dir = scr_get_approximate_direction(dx, dy);
	var dest_ij = scr_get_adjacent_cell_in_direction(scr_rc_to_gi(in_range_x), scr_rc_to_gi(in_range_y), dir);
	var end_i = scr_decode_grid_coord_i(dest_ij);
	var end_j = scr_decode_grid_coord_j(dest_ij);

	var counter = 0;
	// try to find a shooting spot among 50 tiles surrounding the first nearest tile
	while ( !can_pursue && counter < 50 ) // 50 is an arbitrary limit
	{
		end_i += scr_get_delta_i(counter);
		end_j += scr_get_delta_j(counter);
		if(end_i == target.occ_i && end_j == target.occ_j)
		{
			counter++;
			continue; // never go on top of target
		}
		var snap_end_x = scr_gi_to_rc(end_i);
		var snap_end_y = scr_gi_to_rc(end_j);
		var is_a_shooting_spot = false;
		var in_range = scr_points_are_within_range(snap_end_x, snap_end_y, target.x, target.y, scr_get_shooting_range(id));
		if(in_range) is_a_shooting_spot = scr_can_shoot_unobstructed_from(id, snap_end_x, snap_end_y, target);
		if(is_a_shooting_spot)
		{
			can_pursue = scr_navigate_once(id, snap_end_x, snap_end_y);
		}
	
		counter++;
	}
	
	// if astro still can't pursue, try to go to a spot adjacent to target
	counter = 0;
	while(!can_pursue && counter < 4)
	{
		var dsign = 1 - 2*floor(counter/2);
		var dx = dsign *(counter % 2)*32;
		var dy = dsign * ((counter+1) % 2)*32;
		can_pursue = scr_navigate_with_retries(id, target.x + dx, target.y + dy, 1);
		counter++;
	}
	
	// Set action
	if(can_pursue) current_action = astronaut_action.moving_to_shoot;
}

return can_pursue;