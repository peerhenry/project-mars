var arg_x = argument0;
var arg_y = argument1;

return 
	!position_meeting(arg_x, arg_y, obj_gate);
	// && !position_meeting(arg_x, arg_y, obj_character) // should use some reserved for character thingy
	// && !position_meeting(arg_x, arg_y, obj_suit_closet)
	// && !position_meeting(arg_x, arg_y, obj_wall)