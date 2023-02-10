/// @param grid
/// @param component
function scr_add_to_grid_logic_map(argument0, argument1) {
	var arg_grid = argument0;
	var arg_component = argument1;

	debug_instance_type(argument0, obj_grid);

	scr_trace_script("scr_add_to_grid_logic_map", [argument0, argument1]);

	with(arg_grid)
	{
		var role = scr_get_grid_prop(arg_component, grid_type, macro_grid_prop_role);
		var list_for_role = logic_map[? role];
		ds_list_add(list_for_role, arg_component);
	}


}
