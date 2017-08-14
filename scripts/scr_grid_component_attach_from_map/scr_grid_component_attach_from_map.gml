/// @param component
/// @param grid
var arg_component = argument0;
var arg_grid = argument1;

with(arg_grid)
{
	// Get component's grid props
	var component_grid_props = scr_get_grid_props(arg_component, grid_type);
	
	// Add component to grid's relevant list
	var role = component_grid_props[macro_grid_prop_role];
	var role_list = role_map[? role];
	ds_list_add(role_list, arg_component);
	
	// Set grid in component
	component_grid_props[@macro_grid_prop_grid] = arg_grid;
}