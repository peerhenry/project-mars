scr_trace("constructable destroy event");
//scr_navgrid_clear_cell(occ_i, occ_j); // this caused a bug with hatch removal

// Iterate over all grids this component is connected to
for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
{
	var grid_props = grid_props_map[? grid_type];
	if(!is_undefined(grid_props))
	{
		var grid = grid_props[macro_grid_prop_grid];
		var comps_left = 0;
		var key = encoded_ij;
		// show_debug_message("constr. destroy, key: " + string(encoded_ij));
		with(grid)
		{
			// Remove component from grid
			// show_debug_message("Removing " + scr_object_index_string(other.id) + " from grid..."); // DEBUG
			var role = grid_props[macro_grid_prop_role];
			var list_to_use = role_map[? role];
			var role_index = ds_list_find_index(list_to_use, other.id);
			if(role_index < 0) show_debug_message("Warning, object not found in grid's logic map at destruction!");
			else ds_list_delete(list_to_use, role_index);	// deletes entry in list
			
			// Delete entry in map & key list
			var cell_list = ds_map_find_value(component_map, key);
			// show_debug_message("cell_list exists: " + string(ds_exists(cell_list, ds_type_list)));
			if(!is_undefined(cell_list))
			{
				var cell_index = ds_list_find_index(cell_list, other.id);
				if(cell_index < 0) show_debug_message("Warning, object not found in grid's tile map at destruction!");
				else ds_list_delete(cell_list, cell_index);
				if(ds_list_size(cell_list) == 0)
				{
					ds_list_destroy(cell_list);
					ds_map_delete(component_map, key);
					var key_pos = ds_list_find_index(component_key_list, key);
					ds_list_delete(component_key_list, key_pos);
				}
			}
			
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