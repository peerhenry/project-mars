/// @description makes a new grid and adds the instance
/// @param instance
/// @param grid_type
function scr_grid_new_with_instance(argument0, argument1) {

	scr_trace_script("scr_grid_new_with_instance", [argument0, argument1]);

	var arg_instance = argument0;
	var arg_type = argument1;

	var new_grid = scr_grid_new(arg_type);
	scr_connect_to_grid(new_grid, arg_instance);

	return new_grid;


}
