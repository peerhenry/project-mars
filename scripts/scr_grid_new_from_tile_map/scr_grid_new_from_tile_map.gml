/// @Description Create new grid given a grid tile map: used for grid_part
/// @param tile_map
/// @param tile_key_list
/// @param grid_type
var arg_tile_map = argument0;
var arg_tile_key_list = argument1;
var arg_grid_type = argument2;

var new_grid = scr_grid_new(arg_grid_type);
with(new_grid)
{
	// Destroy grid's default tile map
	ds_map_destroy(tile_map);
	ds_list_destroy(tile_key_list);
	tile_map = arg_tile_map;
	tile_key_list = arg_tile_key_list;
	
	// All components in the tile_map need to get the grid in their props, and the grid needs to set them in its proper role lists
	for(var n = 0; n < ds_list_size(tile_key_list); n++)
	{
		var next_cell = ds_map_find_value(tile_map, ds_list_find_value(tile_key_list, n));
		
		// Now cells must be lists...
		var size = ds_list_size(next_cell);
		for(var n = 0; n < size; n++)
		{
			scr_add_to_grid_logic_map(new_grid, next_component);
			var component_grid_props = scr_get_grid_props(next_component, new_grid.grid_type);
			component_grid_props[@macro_grid_prop_grid] = arg_grid;
		}
	}
}
return new_grid;