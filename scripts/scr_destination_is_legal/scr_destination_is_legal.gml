var arg_x = argument0;
var arg_y = argument1;
var arg_astronaut = argument2;
var arg_i = scr_rc_to_gi(arg_x);
var arg_j = scr_rc_to_gi(arg_y);

if(arg_i == arg_astronaut.occ_i && arg_j == arg_astronaut.occ_j) return true; // astronaut is allowed to go to its own position.

with(obj_astronaut)
{
	if(arg_i == occ_i && arg_j == occ_j) return false; // another astronaut occupies the target
}

return 
	!position_meeting(arg_x, arg_y, obj_gate);
	// && !position_meeting(arg_x, arg_y, obj_suit_closet)
	// && !position_meeting(arg_x, arg_y, obj_wall)