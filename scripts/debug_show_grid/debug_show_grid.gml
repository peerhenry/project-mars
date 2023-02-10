function debug_show_grid(argument0) {
	var arg_grid = argument0;

	with(arg_grid)
	{
		show_debug_message("tile_map size: " + string(ds_map_size(tile_map)));
		show_debug_message("tile_key_list size: " + string(ds_list_size(tile_key_list)));
		show_debug_message("total_production: " + string(total_production));
		show_debug_message("total_demand: " + string(total_demand));
		show_debug_message("net_output: " + string(net_output));
		show_debug_message("storage: " + string(storage));
		show_debug_message("storage_capacity: " + string(storage_capacity));
		show_debug_message("");

	}


}
