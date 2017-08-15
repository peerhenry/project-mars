// The tile map is used for flood fill testing

// grid tile map is component_map for now...

// Returns boolean that indicates if removing the component caused the tile to be removed.

var arg_grid = argument0;
var arg_component = argument1;

with(arg_grid)
{
	var ij = arg_component.encoded_ij;
	var list_at_tile = component_map[? ij]; // has to exist
	
	var existing_index = ds_list_find_index(list_at_tile, arg_component);
	ds_list_delete(list_at_tile, existing_index);
	
	// If there are no more components at the tile, remove the tile
	if(ds_list_empty(list_at_tile))
	{
		ds_list_destroy(list_at_tile);
		ds_map_delete(component_map, ij);
		// NOTE: removing a tile can cause grid to be disconnected. In that case Grid_part should be called by the client script.
		return true;
	}
	else return false;
}