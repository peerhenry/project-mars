/// @Description Returns boolean that indicates if removing the component caused the tile to be removed.
/// @param grid
/// @param component
var arg_grid = argument0;
var arg_component = argument1;

debug_instance_type(argument0, obj_grid);
debug_instance_inherits(argument1, obj_constructable);

scr_trace_script("scr_remove_from_grid_tile_map", [argument0, argument1]);
debug_grid(arg_grid); // DEBUG

with(arg_grid)
{
	var ij = arg_component.encoded_ij;
	var list_at_tile = tile_map[? ij];
	var key_list_index = ds_list_find_index(tile_key_list, ij); // Returns -1 if not found
	
	// Error if key is not present
	if(is_undefined(list_at_tile))
	{
		show_error("No list of components found in grid tile map at components ij key", true);
	}
	if(key_list_index < 0)
	{
		show_error("key not found for grid tile map", true);
	}
	
	var existing_index = ds_list_find_index(list_at_tile, arg_component);
	ds_list_delete(list_at_tile, existing_index);
	
	// If there are no more components at the tile, remove the tile
	if(ds_list_empty(list_at_tile))
	{
		show_debug_message("Destroying list at tile..."); // DEBUG
		ds_list_destroy(list_at_tile);
		ds_map_delete(tile_map, ij);
		ds_list_delete(tile_key_list, key_list_index);
		// NOTE: removing a tile can cause grid to be disconnected. In that case Grid_part should be called by the client script.
		return true;
	}
	else return false;
}