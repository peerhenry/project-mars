var arg_x = argument0;
var arg_y = argument1;
var arg_astronaut = argument2;
var arg_i = scr_rc_to_gi(arg_x);
var arg_j = scr_rc_to_gi(arg_y);

if(arg_i == arg_astronaut.dest_i && arg_j == arg_astronaut.dest_j) return true; // astronaut is allowed to go to its own position.

with(obj_movable)
{
	if(arg_i == dest_i && arg_j == dest_j) return false; // another astronaut is moving to that destination
}

return 
	!position_meeting(arg_x, arg_y, obj_gate);		// can't move onto a gate
	// && !position_meeting(arg_x, arg_y, obj_suit_closet)
	// && !position_meeting(arg_x, arg_y, obj_wall)