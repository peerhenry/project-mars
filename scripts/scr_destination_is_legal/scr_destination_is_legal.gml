var arg_x = argument0;
var arg_y = argument1;
var arg_i = scr_rc_to_gi(arg_x);
var arg_j = scr_rc_to_gi(arg_y);

with(obj_character)
{
	if(arg_i == occ_i && arg_j == occ_j) return false;
}

return 
	!position_meeting(arg_x, arg_y, obj_gate);
	// && !position_meeting(arg_x, arg_y, obj_suit_closet)
	// && !position_meeting(arg_x, arg_y, obj_wall)