/// @arg i_start
/// @arg j_start
/// @arg i_finish
/// @arg j_finish
function scr_setup_hall(argument0, argument1, argument2, argument3) {
	var i_start = argument0;
	var j_start = argument1;
	var i_finish = argument2;
	var j_finish = argument3;

	if(i_start == i_finish)	// vertical hall
	{
		var i_min = min(i_start, i_finish);
		var j_min = min(j_start, j_finish);
		var j_length = abs(j_start - j_finish) + 1;
		scr_setup_room(i_min, j_min, 1, j_length);
	
		var add_top_door = position_meeting(scr_gi_to_rc(i_min), scr_gi_to_rc(j_min - 1), obj_base_tile);
		if(add_top_door) scr_setup_door(i_min, j_min, 0);
		var add_bottom_door = position_meeting(scr_gi_to_rc(i_min), scr_gi_to_rc(j_min + j_length), obj_base_tile);
		if(add_bottom_door) scr_setup_door(i_min, j_min + j_length - 1, 0);
	}
	else if(j_start == j_finish) // horizontal hall
	{
		var i_min = min(i_start, i_finish);
		var i_length = abs(i_start - i_finish) + 1;
		var j_min = min(j_start, j_finish);
		scr_setup_room(i_min, j_min, i_length, 1);
	
		var add_left_door = position_meeting(scr_gi_to_rc(i_min - 1), scr_gi_to_rc(j_min), obj_base_tile);
		if(add_left_door) scr_setup_door(i_min, j_min, 1);
		var add_right_door = position_meeting(scr_gi_to_rc(i_min + i_length), scr_gi_to_rc(j_min), obj_base_tile);
		if(add_right_door) scr_setup_door(i_min + i_length - 1, j_min, 1);
	}
	else	// hall with knee
	{
		var i_min = min(i_start, i_finish);
		var i_length = abs(i_start - i_finish) + 1;
		var j_min = min(j_start, j_finish);
		var j_length = abs(j_start - j_finish) + 1;
	
		scr_setup_room(i_min, j_min, i_length, 1);
		scr_setup_room(i_min + i_length - 1, j_min, 1, j_length);
	
		var add_left_door = position_meeting(scr_gi_to_rc(i_min - 1), scr_gi_to_rc(j_min), obj_base_tile);
		if(add_left_door) scr_setup_door(i_min, j_min, 1);
		var add_bottom_door = position_meeting(scr_gi_to_rc(i_min + i_length - 1), scr_gi_to_rc(j_min + j_length), obj_base_tile);
		if(add_bottom_door) scr_setup_door(i_min + i_length - 1, j_min + j_length - 1, 0);
	}


}
