/// @param instance
function scr_destroy_grid_props(argument0) {
	var arg_instance = argument0;

	// destroy grid props map
	for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
	{
		var grid_props = arg_instance.grid_props_map[? grid_type];
		if(!is_undefined(grid_props))
		{
			// Array memory is freed when the array is set to 0, so we set the array to 0 in the map.
			ds_map_replace(arg_instance.grid_props_map, grid_type, 0); // free memory (hopefully)
		}
	}
	ds_map_destroy(arg_instance.grid_props_map);


}
