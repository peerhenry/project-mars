/// @param grid
/// @param component

debug_instance_type(argument0, obj_grid);
debug_instance_inherits(argument1, obj_constructable);

var arg_grid = argument0;
var arg_component = argument1;

with(arg_grid)
{
	var ij = arg_component.encoded_ij;
	var list_at_tile = ds_map_find_value(tile_map, ij);
	
	// Create new list at tile if it isn't there yet.
	if(is_undefined(list_at_tile))
	{
		scr_trace("Adding new tile to grid tile_map");
		var new_list = ds_list_create();
		ds_list_add(new_list, arg_component);
		ds_map_add(tile_map, ij, new_list);
		if(ds_list_find_index(tile_key_list, ij) < 0) // returns -1 if not found
		{
			ds_list_add(tile_key_list, ij);
		}
		else show_error("There was a key for grid tile without value in tile_map", true);
	}
	else
	{
		scr_trace("Adding component to existing tile to grid tile_map");
		var existing_index = ds_list_find_index(list_at_tile, arg_component);
		if(existing_index < 0) ds_list_add(list_at_tile, arg_component);
		if(ds_list_find_index(tile_key_list, ij) < 0) // returns -1 if not found
		{
			show_error("There was a value in tile_map for which they key was not registered.", true);
		}
	}
}