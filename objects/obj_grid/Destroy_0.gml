for(var role = 0; role < macro_grid_role_count; role++)
{
	var next_list = role_map[? role];
	ds_list_destroy(next_list);
}

for(var n = 0; n < ds_list_size(component_key_list); n++)
{
	var next_key = ds_list_find_value(component_key_list, n);
	var cell = component_map[? next_key];
	if(ds_exists(cell, ds_type_list))
	{
		ds_list_destroy(cell);
	}
}

ds_map_destroy(role_map);
ds_map_destroy(component_map);
ds_list_destroy(component_key_list);