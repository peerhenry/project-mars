// set door rooms to noone
for(var n = 0; n < ds_list_size(doors); n++)
{
	var next_door = doors[| n];
	if(id == next_door.room1) next_door.room1 = noone;
	else next_door.room2 = noone;
}

ds_list_destroy(tiles);
ds_list_destroy(doors);
ds_list_destroy(hatches);
ds_list_destroy(leaks);

// remove room from grid
var grid_props = grid_props_map[? macro_grid_oxygen];
var grid = grid_props[macro_grid_prop_grid];
if(grid > 0)
{
	scr_remove_from_grid_logic_map(grid, id);
}

ds_map_destroy(grid_props_map);