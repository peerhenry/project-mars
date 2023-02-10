/// @param grid
/// @param component
function scr_remove_from_grid_logic_map(argument0, argument1) {
	var arg_grid = argument0;
	var arg_component = argument1;

	scr_trace_script("scr_remove_from_grid_logic_map", [argument0, argument1]);
	//debug_grid(arg_grid); // DEBUG

	with(arg_grid)
	{
		var role = scr_get_grid_prop(arg_component, grid_type, macro_grid_prop_role);
		var list_for_role = logic_map[? role];
		var index = ds_list_find_index(list_for_role, arg_component);
		if(index < 0) show_error("Trying to remove a component that was not present in logic map!", true);
		ds_list_delete(list_for_role, index);
	}


}
