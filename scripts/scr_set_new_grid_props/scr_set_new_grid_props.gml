/// @param instance
/// @param grid_type
/// @param role
/// @param value
function scr_set_new_grid_props(argument0, argument1, argument2, argument3) {

	var arg_instance = argument0;
	var arg_grid_type = argument1;
	var arg_role = argument2;
	var arg_value = argument3;

	with(arg_instance)
	{
		var new_grid_props = scr_new_grid_props(arg_role, arg_value);
		ds_map_add(grid_props_map, arg_grid_type, new_grid_props);
	}


}
