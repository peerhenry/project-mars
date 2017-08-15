// The tile map is used for flood fill testing

// grid tile map is component_map for now...

var arg_grid = argument0;
var arg_component = argument1;

with(arg_grid)
{
	var ij = arg_component.encoded_ij;
	var list_at_tile = component_map[? ij];
	
	// Create new list at tile if it isn't there yet.
	if(is_undefined(list_at_tile))
	{
		var new_list = ds_list_create();
		ds_list_add(new_list, arg_component);
		ds_map_add(component_map, ij, new_list);
	}
	else
	{
		var existing_index = ds_list_find_index(list_at_tile, arg_component);
		if(existing_index < 0) ds_list_add(list_at_tile, arg_component);
	}
}