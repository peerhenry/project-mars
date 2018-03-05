/// @param instance
var arg_instance = argument0;

// Iterate over all grids this component is connected to
for(var grid_type = 0; grid_type < macro_grid_type_count; grid_type++)
{
	var grid_props = arg_instance.grid_props_map[? grid_type];
	if(!is_undefined(grid_props))
	{
		var grid = grid_props[macro_grid_prop_grid];
		var comps_left = 0;
		var key = arg_instance.encoded_ij;
		var cell_was_removed = false;
		// show_debug_message("constr. destroy, key: " + string(encoded_ij));
		
		if(grid != noone)
		{
			scr_remove_from_grid_logic_map(grid, arg_instance);
			cell_was_removed = scr_remove_from_grid_tile_map(grid, arg_instance);
			with(grid)
			{
				comps_left = ds_list_size(tile_key_list);
			}
			// Destroy the grid if there are no more components in grid
			if(comps_left == 0) 
			{
				instance_destroy(grid);
			}
			else
			{
				debug_grid(grid); // DEBUG
				var grid_may_part_here = scr_grid_could_part(id, grid_type);
				
				if(cell_was_removed && grid_may_part_here) // Check if any adjacents in surrounding components are disconnected
				{
					scr_grid_part(grid);
				}
			}
		}
	}
}