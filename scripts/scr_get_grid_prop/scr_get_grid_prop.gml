/// @param component_instance
/// @param grid_type
/// @param grid_prop

var arg_component = argument0;
var arg_grid_type = argument1;
var arg_grid_prop = argument2;

var grid_props = arg_component.grid_props_map[? arg_grid_type];
return grid_props[arg_grid_prop];