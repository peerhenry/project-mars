/// @description Checks if component has grid props belonging to grid type.
/// @param component
/// @param grid_type
function scr_has_grid_props(argument0, argument1) {

	var arg_component = argument0;
	var arg_grid_type = argument1;

	var grid_props = arg_component.grid_props_map[? arg_grid_type];
	return !is_undefined(grid_props);


}
