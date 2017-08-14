/// @description Insert description here
// You can write your code in this editor
ds_list_destroy(tiles);
ds_list_destroy(doors);
ds_list_destroy(hatches);

// remove room from grid
var grid_props = grid_props_map[? macro_grid_oxygen];
var grid = grid_props[macro_grid_prop_grid];
// scr_assert_instance_type(grid, obj_grid); // DEBUG
with(grid)
{
	var role = grid_props[macro_grid_prop_role];
	var list_to_use = role_map[? role];
	var index = ds_list_find_index(list_to_use, other.id);
	ds_list_delete(list_to_use, index);
}

ds_map_destroy(grid_props_map);