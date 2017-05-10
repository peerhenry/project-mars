var astronaut = argument0;
var end_x = argument1;
var end_y = argument2;
var start_x = astronaut.x;
var start_y = astronaut.y;

var end_i = (end_x - 16) div 32;
var end_j = (end_y - 16) div 32;
var snap_end_x = (end_i + 1)*32;
var snap_end_y = (end_j + 1)*32;

var max_loop = 100;
var counter = 0;

var navigation_grid = scr_get_nav_grid();

// cell must be cleared before checking if path can be found.
mp_grid_clear_cell(navigation_grid, astronaut.occ_i, astronaut.occ_j);
var path_found = mp_grid_path(navigation_grid, astronaut.path, start_x, start_y, snap_end_x, snap_end_y, true);

while ( !path_found && counter < max_loop )
{	
	end_i += scr_get_delta_i(counter);
	end_j += scr_get_delta_j(counter);
	
	snap_end_x = (end_i + 1)*32;
	snap_end_y = (end_j + 1)*32;
	if(scr_destination_is_legal(snap_end_x, snap_end_y))
	{
		path_found = mp_grid_path(navigation_grid, astronaut.path, start_x, start_y, snap_end_x, snap_end_y, true);
	}
	
	counter++;
}

if(path_found)
{
	astronaut.occ_i = end_i;
	astronaut.occ_j = end_j;
	mp_grid_add_cell(navigation_grid, end_i, end_j);
	with(astronaut)	path_start(astronaut.path, astronaut.movement_speed, path_action_stop, false); // path, speed, end action, absolute
}
else
{
	mp_grid_add_cell(navigation_grid, astronaut.occ_i, astronaut.occ_j);
}

return path_found;