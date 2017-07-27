/// @description adds grid_2 to grid_1
/// @param grid_1
/// @param grid_2

var arg_grid_1 = argument0;
var arg_grid_2 = argument1;

// Iterate over roles: consumer/source/carrier/storage
var rolo = macro_grid_role_count;
for(var role = 0; role < rolo; role++)
{
	var next_component_list_grid_1 = arg_grid_1.role_map[? role];
	var next_component_list_grid_2 = arg_grid_2.role_map[? role];
	for(var n = 0; n < ds_list_size(next_component_list_grid_2); n++) // replace grid in each components
	{
		var next_component = ds_list_find_value(next_component_list_grid_2, n);
		scr_replace_grid(next_component, arg_grid_1);
	}
	scr_join_lists(next_component_list_grid_1, next_component_list_grid_2);
}

var key_list_1 = arg_grid_1.component_key_list;
var key_list_2 = arg_grid_2.component_key_list;
var map_1 = arg_grid_1.component_map;
var map_2 = arg_grid_2.component_map;

// put all components from map2 into map1
for(var n = 0; n < ds_list_size(key_list_2); n++)
{
	var next_key = ds_list_find_value(key_list_2, n);
	var next_component = ds_map_find_value(map_2, next_key);
	ds_map_add(map_1, next_key, next_component);
}

// Add all keys from list 1 to list 2
scr_join_lists(key_list_1, key_list_2);

instance_destroy(arg_grid_2);

return arg_grid_1;