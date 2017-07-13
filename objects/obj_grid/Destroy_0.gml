for(var role = 0; role < macro_grid_role_count; role++)
{
	var next_list = components_map[? role];
	ds_list_destroy(next_list);
}

ds_map_destroy(components_map);