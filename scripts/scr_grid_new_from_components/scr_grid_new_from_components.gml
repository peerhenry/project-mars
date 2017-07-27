/// @param component_map
/// @param component_key_list
/// @param grid_type
var arg_component_map = argument0;
var arg_component_key_list = argument1;
var arg_grid_type = argument2;

var new_grid = scr_grid_new(arg_grid_type);
with(new_grid)
{
	ds_map_destroy(component_map);
	ds_list_destroy(component_key_list);
	component_map = arg_component_map;
	component_key_list = arg_component_key_list;
	
	// All components in the component_map need to get the grid in their props, and the grid needs to set them in its proper role lists
	for(var n = 0; n < ds_list_size(component_key_list); n++)
	{
		var next_cell = ds_map_find_value(component_map, ds_list_find_value(component_key_list, n));
		
		// If the cell is a list, iterate over that list
		if(ds_exists(next_cell, ds_type_list))
		{
			var size = ds_list_size(next_cell);
			for(var n = 0; n < size; n++)
			{
				var next_component = ds_list_find_value(next_cell, n);
				scr_grid_component_attach_from_map(next_component, new_grid); // set grid in props, and add to role list
			}
		}
		else
		{
			scr_grid_component_attach_from_map(next_cell, new_grid); // set grid in props, and add to role list
		}
	}
}
return new_grid;