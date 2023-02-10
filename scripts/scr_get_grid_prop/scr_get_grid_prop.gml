/// @param component_instance
/// @param grid_type
/// @param grid_prop
function scr_get_grid_prop(argument0, argument1, argument2) {

	var arg_component = argument0;
	var arg_grid_type = argument1;
	var arg_grid_prop = argument2;

	var grid_props = arg_component.grid_props_map[? arg_grid_type];
	return grid_props[arg_grid_prop];


}
