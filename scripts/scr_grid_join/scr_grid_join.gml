/// @description adds grid_2 to grid_1
/// @param grid_1
/// @param grid_2

var arg_grid_1 = argument0;
var arg_grid_2 = argument1;

// iterate over roles: consumer/source/carrier/storage
var rolo = macro_grid_role_count;
for(var role = 0; role < rolo; role++)
{
	var next_component_list_grid_1 = arg_grid_1.components_map[? role];
	var next_component_list_grid_2 = arg_grid_2.components_map[? role];
	for(var n = 0; n < ds_list_size(next_component_list_grid_2); n++) // replace grid in each components
	{
		var next_component = ds_list_find_value(next_component_list_grid_2, n);
		scr_replace_grid(next_component, arg_grid_1);
	}
	scr_join_lists(next_component_list_grid_1, next_component_list_grid_2);
}

instance_destroy(arg_grid_2);

return arg_grid_1;