/// @param assignable
/// @param astronaut
var arg_assignable = argument0;
var arg_astronaut = argument1;

var can_assign = false;
if(!arg_assignable.is_assigned)
{
	// Return false if the assignment cannot be done
	// if(!scr_can_assign(arg_assignable, arg_astronaut)) return false; // moved to scr_command_assign
	
	// Check if astronaut can navigate to assignable.
	var ass_i = scr_rc_to_gi(arg_assignable.x);
	var ass_j = scr_rc_to_gi(arg_assignable.y);
	var astro_i = scr_rc_to_gi(arg_astronaut.x);
	var astro_j = scr_rc_to_gi(arg_astronaut.y);
	var needs_to_navigate = true;
		
	var already_adjacent = (astro_i == ass_i && abs(astro_j - ass_j) == 1)
		|| (astro_j == ass_j && abs(astro_i - ass_i) == 1);
		
	if(already_adjacent)
	{
		can_assign = true; // no need to navigate
	}
	else // Try to navigate to any cell adjacent to the assignable
	{
		// Get all adjacent cells (warning: incomplete for constructions with multiple cells)
		with(arg_astronaut)
		{
			scr_navgrid_clear_cell(occ_i, occ_j);
			scr_navgrid_clear_cell(dest_i, dest_j);
		}
		var try_west = scr_navgrid_cell_is_free(ass_i-1, ass_j);
		var try_east = scr_navgrid_cell_is_free(ass_i+1, ass_j);
		var try_north = scr_navgrid_cell_is_free(ass_i, ass_j-1);
		var try_south = scr_navgrid_cell_is_free(ass_i, ass_j+1);
		
		var adj_arr_dx = [0,0,0,0];
		var adj_arr_dy = [0,0,0,0];
		var free_spots = [false, false, false, false];
		
		var di = astro_i - ass_i;
		var dj = astro_j - ass_j;
		if(dj > di)
		{
			if(dj > -di)
			{
				// south is closest
				adj_arr_dx[0] = 0; adj_arr_dy[0] = 32;	free_spots[0] = try_south;// south
				adj_arr_dx[1] = 32; adj_arr_dy[1] = 0;	free_spots[1] = try_east;// east
				adj_arr_dx[2] = -32; adj_arr_dy[2] = 0;	free_spots[2] = try_west; // west
				adj_arr_dx[3] = 0; adj_arr_dy[3] = -32; free_spots[3] = try_north; // north
			}
			else
			{
				// west is closest
				adj_arr_dx[0] = -32; adj_arr_dy[0] = 0;	free_spots[0] = try_west; // west
				adj_arr_dx[1] = 0; adj_arr_dy[1] = -32; free_spots[1] = try_north; // north
				adj_arr_dx[2] = 0; adj_arr_dy[2] = 32;	free_spots[2] = try_south;// south
				adj_arr_dx[3] = 32; adj_arr_dy[3] = 0;	free_spots[3] = try_east;// east
			}
		}
		else
		{
			if(dj > -di)
			{
				// east is closest
				adj_arr_dx[0] = 32; adj_arr_dy[0] = 0;	free_spots[0] = try_east; // east
				adj_arr_dx[1] = 0; adj_arr_dy[1] = -32; free_spots[1] = try_north; // north
				adj_arr_dx[2] = 0; adj_arr_dy[2] = 32;	free_spots[2] = try_south;// south
				adj_arr_dx[3] = -32; adj_arr_dy[3] = 0;	free_spots[3] = try_west; // west
			}
			else
			{
				// north is closest
				adj_arr_dx[0] = 0; adj_arr_dy[0] = -32; free_spots[0] = try_north; // north
				adj_arr_dx[1] = 32; adj_arr_dy[1] = 0;	free_spots[1] = try_east; // east
				adj_arr_dx[2] = -32; adj_arr_dy[2] = 0;	free_spots[2] = try_west; // west
				adj_arr_dx[3] = 0; adj_arr_dy[3] = 32;	free_spots[3] = try_south; // south
			}
		}
		
		with(obj_astronaut)
		{
			scr_navgrid_clear_cell(occ_i, occ_j);
			scr_navgrid_clear_cell(dest_i, dest_j);
		}
		
		var n = 0;
		while(!can_assign)
		{
			var dx = adj_arr_dx[n];
			var dy = adj_arr_dy[n];
			if(free_spots[n]) can_assign = scr_navigate_once(arg_astronaut, arg_assignable.x + dx, arg_assignable.y + dy);
			n++;
		}
		
		/*
		if(try_west) can_assign = scr_navigate_once(arg_astronaut, arg_assignable.x-32, arg_assignable.y);
		if(!can_assign && try_east) can_assign = scr_navigate_once(arg_astronaut, arg_assignable.x+32, arg_assignable.y);
		if(!can_assign && try_north) can_assign = scr_navigate_once(arg_astronaut, arg_assignable.x, arg_assignable.y-32);
		if(!can_assign && try_south) can_assign = scr_navigate_once(arg_astronaut, arg_assignable.x, arg_assignable.y+32);
		*/
		
		with(obj_astronaut)
		{
			scr_navgrid_occupy(occ_i, occ_j);
			scr_navgrid_occupy(dest_i, dest_j);
		}
	}
}

if(can_assign)
{
	arg_assignable.is_assigned = true;
	arg_assignable.assigned_astronaut = arg_astronaut;
	arg_astronaut.assigned_object = arg_assignable;
}

return can_assign;