/// @param component_instance
/// @param grid_type
/// @param grid_prop
/// @param value
function scr_set_grid_prop(argument0, argument1, argument2, argument3) {

	var arg_component = argument0;
	var arg_grid_type = argument1;
	var arg_grid_prop = argument2;
	var arg_value = argument3;

	var grid_props = arg_component.grid_props_map[? arg_grid_type];
	if(!is_undefined(grid_props))
	{
		grid_props[@arg_grid_prop] = arg_value;
	}
	else show_error("grid_props is undefined in scr_set_grid_prop", false);


}
