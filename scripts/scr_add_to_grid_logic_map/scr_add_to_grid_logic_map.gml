// The logic map is used for grid calculations; input, output, storage etc.

// grid logic map is role_map for now...

var arg_grid = argument0;
var arg_component = argument1;

with(arg_grid)
{
	var role = scr_get_grid_prop(arg_component, grid_type, macro_grid_prop_role);
	var list_for_role = role_map[? role];
	ds_list_add(list_for_role, arg_component);
}