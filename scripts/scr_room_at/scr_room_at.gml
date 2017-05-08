/// Checks if a baseroom exists at coordinates and returns id.
var arg_x = argument0;
var arg_y = argument1;

var arg_i = scr_rc_to_gi(arg_x);
var arg_j = scr_rc_to_gi(arg_y);

with(obj_room){
	var is_in_bb = point_in_rectangle(arg_x, arg_y, bb_left, bb_top, bb_right, bb_bottom);
	if(is_in_bb && scr_check_tile_in_room(id, arg_i, arg_j)){
		return id;
	}
}

return noone;