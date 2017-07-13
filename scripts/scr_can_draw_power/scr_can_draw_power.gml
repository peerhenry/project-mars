/// @param component
var arg_component = argument0;

var grid_props = arg_component.grid_props_map[? macro_grid_electric];
var electric_grid = grid_props[macro_grid_component_grid];
return electric_grid.net_output > 0 || electric_grid.total_storage > 0;