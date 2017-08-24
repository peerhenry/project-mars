/// @param grid
/// @param component
var arg_grid = argument0;
var arg_component = argument1;

with(arg_grid)
{
	var role = scr_get_grid_prop(arg_component, grid_type, macro_grid_prop_role);
	var list_for_role = logic_map[? role];
	var index = ds_list_find_index(list_for_role, arg_component);
	ds_list_delete(list_for_role, index);
}