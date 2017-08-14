/// @description Adds component to grid and sets grid in component
/// @param grid
/// @param component
var arg_grid = argument0;
var arg_component = argument1;

// scr_assert_instance_type(arg_grid, obj_grid);

with(arg_grid)
{
	// Get component's grid props
	var component_grid_props = scr_get_grid_props(arg_component, grid_type);
	
	// Add component to grid's relevant list
	var role = component_grid_props[macro_grid_prop_role];
	var component_list = role_map[? role];
	ds_list_add(component_list, arg_component);
	
	// Add component to grid's map
	if(object_is_ancestor(arg_component.object_index, obj_constructable))
	{
		var key = arg_component.encoded_ij;
		var cell = ds_map_find_value(component_map, key);
		if(is_undefined(cell))
		{
			ds_list_add(component_key_list, key);
			var new_cell_list = ds_list_create();
			ds_list_add(new_cell_list, arg_component);
			ds_map_add(component_map, key, new_cell_list);
		}
		else	// If grid already has a cell at given location
		{
			if(ds_exists(cell, ds_type_list))	// If cell is a list, add the component to list
			{
				ds_list_add(cell, arg_component);
			}
			else	// Has to be a list...
			{
				show_error("Error: something existed at a grid cell, but it was not a list!", true);
				/*var new_cell = ds_list_create();
				ds_list_add(new_cell, cell, arg_component);
				ds_map_replace(component_map, key, new_cell);*/
			}
		}
	}
	else
	{
		// show_debug_message("name: " + object_get_name(arg_component.object_index));
		// show_error("component did not inherit from obj_constructable", true);
	}
	
	// Set grid in component
	show_debug_message("setting grid in component: " + string(object_get_name(arg_grid.object_index))); // DEBUG
	component_grid_props[@macro_grid_prop_grid] = arg_grid;
}