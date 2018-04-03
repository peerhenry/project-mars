/// @param astronaut
/// @param x
/// @param y
var arg_astronaut = argument0;
var end_x = argument1;
var end_y = argument2;

var start_x = arg_astronaut.x;
var start_y = arg_astronaut.y;
var end_i = (end_x - 16) div 32;
var end_j = (end_y - 16) div 32;
var snap_end_x = (end_i + 1)*32;
var snap_end_y = (end_j + 1)*32;

var counter = 0;

var navigation_grid = scr_get_nav_grid();

// ## clear all character cells before trying to navigate
with(obj_movable)
{
	mp_grid_clear_cell(navigation_grid, occ_i, occ_j);
}

// $$ for suitless astronauts, hatches are impassable
if(!arg_astronaut.wears_suit)
{
	with(obj_hatch)
	{
		mp_grid_add_cell(navigation_grid, occ_i, occ_j);
	}
}

// %% enemy gates are impassable
with(obj_gate)
{
	if(owner != arg_astronaut.owner) mp_grid_add_cell(navigation_grid, occ_i, occ_j);
}

var path_found = false;
// # meat and bones
if(scr_navgrid_cell_is_free(end_i, end_j) && scr_destination_is_legal(snap_end_x, snap_end_y, arg_astronaut))
{
	var dummy_path = path_add();
	path_found = mp_grid_path(navigation_grid, dummy_path, start_x, start_y, snap_end_x, snap_end_y, true);
	path_delete(dummy_path);
}

// %% reset enemy gate passability
with(obj_gate)
{
	if(owner != arg_astronaut.owner && !locked) mp_grid_clear_cell(navigation_grid, occ_i, occ_j);
}

// $$ reset hatches passability if astronaut is suitless
if(!arg_astronaut.wears_suit)
{
	with(obj_hatch)
	{
		if(!locked) mp_grid_clear_cell(navigation_grid, occ_i, occ_j);
	}
}

// ## reset all navgrid cells at astronaut positions.
with(obj_movable)
{
	mp_grid_add_cell(navigation_grid, occ_i, occ_j);
}

return path_found;