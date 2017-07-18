/// @param component
/// @param grid_type

var arg_component = argument0;
var arg_grid_type = argument1;

var grid_props = arg_component.grid_props_map[? arg_grid_type];
var grid = grid_props[macro_grid_component_grid];
if(grid <= 0) return false;
return (grid.net_output > 0 || grid.storage > 0);