/// @description adds grid_2 to grid_1
/// @param grid_1
/// @param grid_2

var arg_grid_1 = argument0;
var arg_grid_2 = argument1;

// show_debug_message("joining grids: " + string(arg_grid_1) + " and " + string(arg_grid_2));

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
	scr_add_lists(next_component_list_grid_1, next_component_list_grid_2);
}

var key_list_1 = arg_grid_1.component_key_list;
var key_list_2 = arg_grid_2.component_key_list;
var map_1 = arg_grid_1.component_map;
var map_2 = arg_grid_2.component_map;

// show_debug_message("key_list_1: " + string(key_list_1));
// show_debug_message("key_list_2: " + string(key_list_2));
if(!ds_exists(key_list_1, ds_type_list)) show_error("No key_list_1", true);
if(!ds_exists(key_list_2, ds_type_list)) show_error("No key_list_2", true);

// put all cell_lists from map2 into map1
for(var n = 0; n < ds_list_size(key_list_2); n++)
{
	var next_key = ds_list_find_value(key_list_2, n);
	var next_cell_list = ds_map_find_value(map_2, next_key);
	
	// check if map one has cell at key,
	var cell_list_1_at_key = map_1[? next_key];
	if(!is_undefined(cell_list_1_at_key))
	{
		// add lists
		scr_add_lists(cell_list_1_at_key, next_cell_list);
	}
	else
	{
		// make a new list and copy
		var new_list = ds_list_create();
		scr_add_lists(new_list, next_cell_list);
		ds_map_add(map_1, next_key, new_list);
	}
}

// Add all keys from list 2 to list 1
scr_add_lists(key_list_1, key_list_2);

if(!ds_exists(key_list_1, ds_type_list)) show_error("No key_list_1 after scr_add_lists", true);
if(!ds_exists(key_list_2, ds_type_list)) show_error("No key_list_2 after scr_add_lists", true);

instance_destroy(arg_grid_2);

if(ds_exists(key_list_2, ds_type_list)) show_error("Error: key_list_2 still exists after grid 2 destroy!", true);
if(!ds_exists(key_list_1, ds_type_list)) show_error("No key_list_1 after grid 2 destroy", true);

return arg_grid_1;