var arg_comp = argument0;

with(arg_comp)
{
	for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
	{
		var has_grid = scr_has_grid_props(arg_comp, grid_type)
		if(!has_grid)
		{
			show_debug_message("No grid for type: " + string(grid_type));
		}
		else
		{
			var next_grid = scr_get_grid(arg_comp, grid_type);
			show_debug_message("grid type: " + string(grid_type));
			show_debug_message("grid: " + string(next_grid));
			show_debug_message("component_map size: " + string(ds_map_size(next_grid.component_map)));
			show_debug_message("component_key_list size: " + string(ds_list_size(next_grid.component_key_list)));
		}
	}
}