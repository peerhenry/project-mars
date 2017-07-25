//scr_navgrid_clear_cell(occ_i, occ_j);

// remove this instance from all grids of which it is part
for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
{
	var grid_props = grid_props_map[? grid_type];
	if(!is_undefined(grid_props))
	{
		var grid = grid_props[macro_grid_component_grid];
		if(grid > 0)
		{
			var role = grid_props[macro_grid_component_role];
			var list_to_use = grid.components_map[? role];
			var index = ds_list_find_index(list_to_use, id);
			ds_list_delete(list_to_use, index);	// deletes entry in list
		}
	}
}
ds_map_destroy(grid_props_map);