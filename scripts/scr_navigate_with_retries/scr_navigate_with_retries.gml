/// @param astronaut
/// @param end_x
/// @param end_y
/// @param max_retries
var arg_astronaut = argument0;
var arg_end_x = argument1;
var arg_end_y = argument2;
var arg_max_loop = argument3;

var start_x = arg_astronaut.x;
var start_y = arg_astronaut.y;

var end_i = (arg_end_x - 16) div 32;
var end_j = (arg_end_y - 16) div 32;
var snap_end_x = (end_i + 1)*32;
var snap_end_y = (end_j + 1)*32;
var counter = 0;
var navigation_grid = scr_get_nav_grid();

// Clear all character cells before trying to navigate
with(obj_astronaut)
{
	mp_grid_clear_cell(navigation_grid, occ_i, occ_j);
	mp_grid_clear_cell(navigation_grid, dest_i, dest_j);
}

// Astronauts without suits may not go through hatches
if(!arg_astronaut.wears_suit)
{
	with(obj_hatch)
	{
		mp_grid_add_cell(navigation_grid, occ_i, occ_j);
	}
}

var path_found = false;

if(scr_destination_is_legal(snap_end_x, snap_end_y, arg_astronaut))
{
	path_found = mp_grid_path(navigation_grid, arg_astronaut.path, start_x, start_y, snap_end_x, snap_end_y, true);
}

while ( !path_found && counter < arg_max_loop )
{
	end_i += scr_get_delta_i(counter);
	end_j += scr_get_delta_j(counter);
	
	snap_end_x = (end_i + 1)*32;
	snap_end_y = (end_j + 1)*32;
	if(scr_destination_is_legal(snap_end_x, snap_end_y, arg_astronaut))
	{
		path_found = mp_grid_path(navigation_grid, arg_astronaut.path, start_x, start_y, snap_end_x, snap_end_y, true);
	}
	
	counter++;
}

// Navigate the path
if(path_found)
{
	arg_astronaut.dest_i = end_i;
	arg_astronaut.dest_j = end_j;
	with(arg_astronaut)	path_start(arg_astronaut.path, arg_astronaut.movement_speed, path_action_stop, false); // path, speed, end action, absolute
}

// Reset all navgrid cells at astronaut positions.
with(obj_astronaut)
{
	mp_grid_add_cell(navigation_grid, occ_i, occ_j);
	mp_grid_add_cell(navigation_grid, dest_i, dest_j);
}

// Free hatches again for navigation
if(!arg_astronaut.wears_suit){
	with(obj_hatch)
	{
		mp_grid_clear_cell(navigation_grid, occ_i, occ_j);
	}
}

return path_found;