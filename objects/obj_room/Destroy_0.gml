/// @description Insert description here
// You can write your code in this editor
ds_list_destroy(tiles);
ds_list_destroy(doors);
ds_list_destroy(hatches);

// remove room from grid
var grid_props = grid_props_map[? macro_grid_oxygen];
var grid = grid_props[macro_grid_prop_grid];
if(grid > 0)
{
	scr_remove_from_grid_logic_map(grid, id);
}

ds_map_destroy(grid_props_map);