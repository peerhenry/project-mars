/// @description makes a new grid and adds the component
/// @param component
/// @param grid_type

var arg_instance = argument0;
var arg_type = argument1;

var new_grid = scr_grid_new(arg_type);
scr_grid_add(new_grid, arg_instance);

return new_grid;