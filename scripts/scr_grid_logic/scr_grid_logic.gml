/// @param instance
function scr_grid_logic(argument0) {

	scr_trace_script("scr_grid_logic", [argument0]);

	var arg_instance = argument0;
	var arg_object_index = arg_instance.object_index;

	var grid_count = ds_map_size(arg_instance.grid_props_map);
	if(grid_count == 0) exit;

	var location_x = arg_instance.x;
	var location_y = arg_instance.y;

	// loop over grid types
	for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
	{
		//var grid_props = scr_get_grid_props(arg_instance, grid_type);
		if(scr_has_grid_props(arg_instance, grid_type))
		{
			var grid = scr_connect_adjacent_grids(arg_instance, grid_type);
			if(grid == noone)
			{
				grid = scr_grid_new_with_instance(arg_instance, grid_type);
			}
			scr_grid_update(grid);
			scr_grid_notify_components(grid);
		}
	}


}
