/// @arg astronaut
scr_trace("cancel moving");
var arg_entity = argument0;

enum cancel_walking_result
{
	stop,
	move_to_center,
	failure
}

// move to center of current grid cell.
var center_x = scr_gi_to_rc(arg_entity.occ_i); //scr_rc_clamp_center(arg_entity.x);
var center_y = scr_gi_to_rc(arg_entity.occ_j); //scr_rc_clamp_center(arg_entity.y);
var dx = abs(center_x - arg_entity.x);
var dy = abs(center_y - arg_entity.y);
if(dx < 2 && dy < 2)
{
	arg_entity.x = center_x;
	arg_entity.y = center_y;
	scr_stop_moving(arg_entity);
	return cancel_walking_result.stop;
}
else
{
	var can_go_to_center = scr_navigate(arg_entity, center_x, center_y);
	if(!can_go_to_center)
	{
		show_debug_message("WARNIG! not able to nav to center of tile..."); // DEBUG
		scr_stop_moving(arg_entity);
		return cancel_walking_result.failure;
	}
	else
	{
		return cancel_walking_result.move_to_center;
	}
}