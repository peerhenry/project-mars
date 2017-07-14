/// @param component
/// @param grid_type

var arg_component = argument0;
var arg_grid_type = argument1;

var grid_props = arg_component.grid_props_map[? arg_grid_type];
return grid_props != undefined;