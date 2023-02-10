/// @arg i_door
/// @arg j_door
/// @arg i_hatch
/// @arg j_hatch
function scr_setup_hatch_hall(argument0, argument1, argument2, argument3) {
	var i_start = argument0;
	var j_start = argument1;
	var i_finish = argument2;
	var j_finish = argument3;

	if(i_start == i_finish)	// vertical hall
	{
		var i_min = min(i_start, i_finish);
		var j_min = min(j_start, j_finish);
		var j_length = abs(j_start - j_finish);
		scr_setup_room(i_min, j_min, 1, j_length);
	
		scr_setup_single_tile_construction(i_start, j_start, macro_door, 0);
		scr_setup_single_tile_construction(i_finish, j_finish, macro_hatch, 0);
	}
	else if(j_start == j_finish) // horizontal hall
	{
		var i_min = min(i_start, i_finish);
		var i_length = abs(i_start - i_finish);
		var j_min = min(j_start, j_finish);
		scr_setup_room(i_min, j_min, i_length, 1);

		scr_setup_single_tile_construction(i_start, j_start, macro_door, 1);
		scr_setup_single_tile_construction(i_finish, j_finish, macro_hatch, 1);
	}
	/*else	// hall with knee
	{
		var i_min = min(i_start, i_finish);
		var i_length = abs(i_start - i_finish) + 1;
		var j_min = min(j_start, j_finish);
		var j_length = abs(j_start - j_finish) + 1;
	
		scr_setup_room(i_min, j_min, i_length, 1);
		scr_setup_room(i_min + i_length - 1, j_min, 1, j_length);
	
		var gate1 = macro_hatch;
		var gate2 = macro_door;
		if(i_min == i_start)
		{
			gate1 = macro_door;
			gate2 = macro_hatch;
		}
		scr_setup_single_tile_construction(i_min, j_min, gate1, 1);
		scr_setup_single_tile_construction(i_min + i_length - 1, j_min + j_length - 1, gate2, 0);
	}*/


}
