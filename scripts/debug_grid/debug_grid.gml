// Tests if grid meets ds requirements
/// @param grid
var arg_grid = argument0;

show_debug_message("DEBUGGING GRID " + string(arg_grid) + "...");
var failed = false;

if(arg_grid.object_index != obj_grid)
{
	show_error("Invalid grid! Instance is not a obj_grid", true);
	failed = true;
}

with(arg_grid)
{
	var test1 = ds_exists(tile_map, ds_type_map);
	if(!test1) show_error("Invalid grid! No tile_map", true);
	
	var test2 = ds_exists(tile_key_list, ds_type_list);
	if(!test2) show_error("Invalid grid! No tile_key_list", true);
	
	for(var n = 0; n < ds_list_size(tile_key_list); n++)
	{
		var cell = tile_map[? ds_list_find_value(tile_key_list, n)];
		var list_exists = ds_exists(cell, ds_type_list);
		if(!list_exists)
		{
			show_error("Invalid grid! No list found for cell in tile_map.", true);
			failed = true;
		}
		else if(ds_list_size(cell) == 0)
		{
			show_error("Invalid grid! List at tile was empty.", true);
			failed = true;
		}
		else
		{
			for(var m = 0; m < ds_list_size(cell); m++)
			{
				var next_comp = ds_list_find_value(cell, m);
				if(!instance_exists(next_comp)) show_error("Grid contained a component in tile_map that was not an object instance! " + string(next_comp), true);
				if(!object_is_ancestor(next_comp.object_index, obj_constructable)) show_error("Grid contained a component in tile_map that was not a constructable!", true);
			}
		}
	}
	
	var test3 = ds_exists(logic_map, ds_type_map);
	if(!test3) show_error("Invalid grid! No logic_map", true);
	
	var test4 = ds_list_size(tile_key_list) == ds_map_size(tile_map);
	if(!test4) show_error("Invalid grid! component_key_list had different length from tile_map", true);
	
	if(!failed && test1 && test2 && test3 && test4) show_debug_message("DEBUG GRID " + string(arg_grid) + " PASSED.");
}