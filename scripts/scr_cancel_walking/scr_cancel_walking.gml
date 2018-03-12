/// @arg astronaut
scr_trace("cancel moving");
var arg_entity = argument0;

enum cancel_walking_result
{
	stop,
	move_to_center,
	move_from_illegal_spot,
	failure
}

with(arg_entity)
{
	if(scr_instance_inherits(id, obj_task_actor))
	{
		if(assigned_object != noone) scr_unassign_task(assigned_object);
		construction = noone;
	}
	else if(scr_instance_inherits(id, obj_cart))
	{
		instance_destroy(deploy_ghost);
		deploy_ghost = noone;
		current_action = cart_action.idle;
	}
}

var result = cancel_walking_result.stop;

// move to center of current grid cell.
var center_x = scr_gi_to_rc(arg_entity.occ_i); //scr_rc_clamp_center(arg_entity.x);
var center_y = scr_gi_to_rc(arg_entity.occ_j); //scr_rc_clamp_center(arg_entity.y);
var dx = abs(center_x - arg_entity.x);
var dy = abs(center_y - arg_entity.y);
if(dx < 2 && dy < 2)
{
	if(scr_destination_is_legal(center_x, center_y, arg_entity)) // also check if it's legal to stop here
	{
		arg_entity.x = center_x;
		arg_entity.y = center_y;
		scr_stop_moving(arg_entity);
		result = cancel_walking_result.stop;
	}
	else
	{
		var can_go_to_center = scr_navigate(arg_entity, center_x, center_y);
		if(!can_go_to_center)
		{
			show_debug_message("WARNIG! not able to nav to center of tile..."); // DEBUG
			scr_stop_moving(arg_entity);
			result = cancel_walking_result.failure;
		}
		else result = cancel_walking_result.move_from_illegal_spot;
	}
}
else
{
	var can_go_to_center = scr_navigate(arg_entity, center_x, center_y);
	if(!can_go_to_center)
	{
		show_debug_message("WARNIG! not able to nav to center of tile..."); // DEBUG
		scr_stop_moving(arg_entity);
		result = cancel_walking_result.failure;
	}
	else
	{
		result = cancel_walking_result.move_to_center;
	}
}

arg_entity.last_cancel_walking_result = result;
return result;