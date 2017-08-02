/// @description adds component to grid and sets grid in component
/// @param grid
/// @param component
var arg_grid = argument0;
var arg_component = argument1;

with(arg_grid)
{
	// Get component's grid props
	var component_grid_props = scr_get_grid_props(arg_component, grid_type);
	
	// Add component to grid's relevant list
	var role = component_grid_props[macro_grid_component_role];
	var component_list = role_map[? role];
	ds_list_add(component_list, arg_component);
	
	// Add component to grid's map
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
		else	// Create a list
		{
			show_error("Error: something existed at a grid cell, but it was not a list!", true);
			/*var new_cell = ds_list_create();
			ds_list_add(new_cell, cell, arg_component);
			ds_map_replace(component_map, key, new_cell);*/
		}
	}
	
	// Set grid in component
	component_grid_props[@macro_grid_component_grid] = arg_grid;
}