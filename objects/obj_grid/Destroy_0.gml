scr_trace("Destroying grid " + string(id));

for(var role = 0; role < macro_grid_role_count; role++)
{
	var next_list = logic_map[? role];
	ds_list_destroy(next_list);
}

for(var n = 0; n < ds_list_size(tile_key_list); n++)
{
	var next_key = ds_list_find_value(tile_key_list, n);
	var cell = tile_map[? next_key];
	if(ds_exists(cell, ds_type_list))
	{
		ds_list_destroy(cell);
	}
}

ds_map_destroy(logic_map);
ds_map_destroy(tile_map);
ds_list_destroy(tile_key_list);