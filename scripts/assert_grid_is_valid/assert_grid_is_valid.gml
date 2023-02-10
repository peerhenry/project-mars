function assert_grid_is_valid(argument0) {
	// Tests if grid meets ds requirements
	/// @param grid
	var arg_grid = argument0;

	var failed = false;

	if(arg_grid.object_index != obj_grid)
	{
		show_debug_message("Invalid grid! Instance is not a obj_grid");
		failed = true;
	}

	if(arg_grid.grid_type < 0 || arg_grid.grid_type >= macro_grid_type_count)
	{
		show_debug_message("Invalid grid! Does not have a valid grid_type");
		failed = true;
	}

	with(arg_grid)
	{
		var test1 = ds_exists(tile_map, ds_type_map);
		if(!test1)
		{
			failed = true;
			show_debug_message("Invalid grid! No component map");
		}
	
		var test2 = ds_exists(tile_key_list, ds_type_list);
		if(!test2)
		{
			failed = true;
			show_debug_message("Invalid grid! No tile_key_list");
		}
	
		for(var n = 0; n<ds_list_size(tile_key_list); n++)
		{
			var cell = tile_map[? ds_list_find_value(tile_key_list, n)];
			var test_cell = ds_exists(cell, ds_type_list);
			if(!test_cell)
			{
				show_debug_message("Invalid grid! No list found for cell in tile_map");
				failed = true;
			}
			else 
			{
				for(var m = 0; m < ds_list_size(cell); m++)
				{
					var next_comp = ds_list_find_value(cell, m);
					if(!object_exists(next_comp)) 
					{
						show_debug_message("Grid contained a component in map that was not an object!");
						failed = true;
					}
					else if(!object_is_ancestor(next_comp.object_index, obj_constructable))
					{
						show_debug_message("Grid contained a component in map that was not a constructable!");
						failed = true;
					}
				}
			}
		}
	
		var test3 = ds_exists(logic_map, ds_type_map);
		if(!test3)
		{
			failed = true;
			show_debug_message("Invalid grid! No logic_map");
		}
	
		var test4 = ds_list_size(tile_key_list) == ds_map_size(tile_map);
		if(!test4)
		{
			failed = true;
			show_debug_message("Invalid grid! tile_key_list had different length from tile_map");
		}
	
		if(!failed) show_debug_message("Grid test passed.");
	}

	if(failed){
			global.current_test_pass = false;
	}


}
