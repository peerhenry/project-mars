//scr_navgrid_clear_cell(occ_i, occ_j); // this caused a bug with hatch removal

// Iterate over all grids this component is connected to
for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
{
	var grid_props = grid_props_map[? grid_type];
	if(!is_undefined(grid_props))
	{
		var grid = grid_props[macro_grid_component_grid];
		var comps_left = 0;
		var key = encoded_ij;
		with(grid)
		{
			// Remove component from grid
			// show_debug_message("Removing " + scr_object_index_string(other.id) + " from grid..."); // DEBUG
			var role = grid_props[macro_grid_component_role];
			var list_to_use = role_map[? role];
			var index = ds_list_find_index(list_to_use, other.id);
			ds_list_delete(list_to_use, index);	// deletes entry in list
			
			// Delete entry in map & key list
			var cell_list = ds_map_find_value(component_map, key);
			var ind = ds_list_find_index(cell_list, key);
			ds_list_delete(cell_list, ind);
			if(ds_list_size(cell_list) == 0)
			{
				ds_list_destroy(cell_list);
				ds_map_delete(component_map, key);
				var key_pos = ds_list_find_index(component_key_list, key);
				ds_list_delete(component_key_list, key_pos);
			}
			/*var cell = ds_map_find_value(component_map, key);
			if(cell == other.id)
			{
				ds_map_delete(component_map, key);
				var key_pos = ds_list_find_index(component_key_list, other.encoded_ij);
				ds_list_delete(component_key_list, key_pos);
			}
			else
			{
				var ind = ds_list_find_index(cell, key);
				ds_list_delete(cell, ind);
				if(ds_list_size(cell) == 1)	// if one item remains, destroy the list
				{
					var new_cell = ds_list_find_value(cell, 0);
					ds_list_destroy(cell);
					ds_map_replace(component_map, key, new_cell);
				}
			}*/
			
			comps_left = ds_list_size(component_key_list);
		}
		
		// Destroy the grid if there are no more components in grid
		if(comps_left == 0) 
		{
			instance_destroy(grid);
		}
		else if(scr_grid_could_part(id, grid_type)) // Check if any adjacents in surrounding components are disconnected
		{
			scr_grid_part(id, grid);
		}
	}
}
ds_map_destroy(grid_props_map);