var end_x = argument0;
var end_y = argument1;
var start_x = x;
var start_y = y;

var i = (end_x - 16) div 32;
var j = (end_y - 16) div 32;
var snap_end_x = (i + 1)*32;
var snap_end_y = (j + 1)*32;

var max_loop = 100;
var counter = 0;

var grid_to_use = global.grid_map;

// cell must be cleared before checking if path can be found.
mp_grid_clear_cell(grid_to_use, occ_i, occ_j);
var path_found = mp_grid_path(grid_to_use, path, start_x, start_y, snap_end_x, snap_end_y, true);

while ( !path_found && counter < max_loop )
{
	var delta = scr_get_delta(counter);
	counter++;
	
	if(delta == 1) // a
	{
		i -= 1;
		j -= 1;
	}
	else if(delta == 2) // b
	{
		i -= 1;
		j += 1;
	}
	else if(delta == 3) // c
	{
		i += 1;
		j += 1;
	}
	else if(delta == 0) // i
	{
		i += 1;
	}
	else if(delta == 4) // d
	{
		i += 1;
		j -= 1;
	}
	
	snap_end_x = (i + 1)*32;
	snap_end_y = (j + 1)*32;
	path_found = mp_grid_path(grid_to_use, path, start_x, start_y, snap_end_x, snap_end_y, true);
}

if(path_found)
{
	mp_grid_add_cell(grid_to_use, i, j);
	occ_i = i;
	occ_j = j;
	mp_grid_add_cell(grid_to_use, i, j);
	//mp_grid_path(global.grid_map, selection.path, start_x, start_y, end_x, end_y, true);
	path_start(path, movement_speed, path_action_stop, false); // path, speed, end action, absolute
}
else
{
	mp_grid_add_cell(grid_to_use, occ_i, occ_j);
}


return path_found;