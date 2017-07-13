/// @description adds component to grid and sets grid in component
/// @param grid
/// @param component
var arg_grid = argument0;
var arg_component = argument1;

with(arg_grid)
{
	var component_grid_props = scr_get_grid_props(arg_component, grid_type);
	var role = component_grid_props[macro_grid_component_role];
	var component_list = components_map[? role];
	ds_list_add(component_list, arg_component);	// set component in grid
	component_grid_props[@macro_grid_component_grid] = arg_grid;	// set grid in component
}