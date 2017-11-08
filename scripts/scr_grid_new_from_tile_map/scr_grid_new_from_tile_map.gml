/// @Description Create new grid given a grid tile map: used for grid_part
/// @param tile_map
/// @param tile_key_list
/// @param grid_type

scr_trace_script("scr_grid_new_from_tile_map", [argument0, argument1, argument2]);
debug_types([argument0, argument1, argument2], [macro_type_map, macro_type_list, macro_type_real]);

var arg_tile_map = argument0;
var arg_tile_key_list = argument1;
var arg_grid_type = argument2;

if(ds_map_size(arg_tile_map) != ds_list_size(arg_tile_key_list)){
	show_error("ERROR! tile map was of different size than tile key list in scr_grid_new_from_tile_map", true);
}

var found_rooms = ds_list_create();

var new_grid = scr_grid_new(arg_grid_type);
with(new_grid)
{
	ds_list_copy(tile_key_list, arg_tile_key_list);
	// copy all the lists in the map:
	for(var n = 0; n < ds_list_size(arg_tile_key_list); n++)
	{
		var next_key = ds_list_find_value(arg_tile_key_list, n);
		var new_list = ds_list_create();
		ds_list_copy(new_list, arg_tile_map[? next_key]);
		ds_map_add(tile_map, next_key, new_list);
	}
	
	// All components in the tile_map need to get the grid in their props, and the grid needs to set them in its proper role lists
	for(var n = 0; n < ds_list_size(arg_tile_key_list); n++)
	{
		var next_cell = ds_map_find_value(arg_tile_map, ds_list_find_value(arg_tile_key_list, n));
		
		// Now cells must be lists...
		var size = ds_list_size(next_cell);
		for(var m = 0; m < size; m++)
		{
			var next_component = ds_list_find_value(next_cell, m);
			scr_add_to_grid_logic_map(new_grid, next_component);
			scr_replace_grid(next_component, new_grid);
			
			// in case of oxygen grid, transfer the rooms to the grid as well...
			if(arg_grid_type == macro_grid_oxygen && next_component.object_index == obj_base_tile)
			{
				var a_room = scr_room_at(next_component.x, next_component.y);
				if(a_room != noone && ds_list_find_index(found_rooms, a_room) == -1)
				{
					scr_connect_to_grid(new_grid, a_room);
					ds_list_add(found_rooms, a_room);
				}
			}
		}
	}
}

debug_grid(new_grid); // DEBUG

ds_list_destroy(found_rooms);
return new_grid;