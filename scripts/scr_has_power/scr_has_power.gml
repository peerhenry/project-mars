/// @description Checks if component has grid, if it can perform its role in grid and if the grid can provide.
/// @param component
/// @param grid_type

var arg_component = argument0;
var arg_grid_type = macro_grid_electric;

var grid_props = arg_component.grid_props_map[? arg_grid_type];
if(is_undefined(grid_props)) return false;
var grid = grid_props[macro_grid_prop_grid];
return (instance_exists(grid) && grid.net_output > 0 || grid.storage > 0);