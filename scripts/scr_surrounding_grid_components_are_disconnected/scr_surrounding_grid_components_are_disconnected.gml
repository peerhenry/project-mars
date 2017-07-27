/// @description Checks if surrounding instances are disconnected
/// @param instance
/// @param grid_type
var arg_instance = argument0;
var arg_grid_type = argument1;

var surrounding_instances = scr_get_surrounding_grid_components(arg_instance, arg_grid_type);
return scr_surrounder_array_is_disconnected(surrounding_instances);