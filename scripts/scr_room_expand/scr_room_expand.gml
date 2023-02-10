function scr_room_expand(argument0, argument1, argument2) {
	var arg_room = argument0;
	var arg_x = argument1;
	var arg_y = argument2;

	var left = scr_rc_clamp_origin(arg_x);
	var top = scr_rc_clamp_origin(arg_y);
	var right = left+32;
	var bottom = top+32;

	var arg_i = scr_rc_to_gi(arg_x);
	var arg_j = scr_rc_to_gi(arg_y);

	with(arg_room){	
		// add tile to room
		scr_add_tile_to_room(id, arg_i, arg_j);
	
		// update bounding box
		if(left < bb_left) bb_left = left;
		if(right > bb_right) bb_right = right;
		if(top < bb_top) bb_top = top;
		if(bottom > bb_bottom) bb_bottom = bottom;
	}


}
