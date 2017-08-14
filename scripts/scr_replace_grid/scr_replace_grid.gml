/// @description replaces grid instance in the given component
/// @param component
/// @param grid
var arg_component = argument0;
var arg_grid = argument1;

with(arg_component)
{
	var grid_props = grid_props_map[? arg_grid.grid_type];
	grid_props[@macro_grid_prop_grid] = arg_grid;
}