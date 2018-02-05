/// @param room
/// @param force_new_room_bool
var le_room = argument0;
var force_new_room = argument1; // will force creation of a new room even if room is connected
var out_room = le_room;

if(ds_list_size(le_room.tiles) == 0) // if there is nothing to part => destroy the room
{
	instance_destroy(le_room);
	return noone;
}

// create all helper ds
var tiles_remaining = ds_list_create(); // tiles unvisited by the flood fill
var all_hatches = ds_list_create();
var all_doors = ds_list_create();
var all_leaks = ds_list_create();
ds_list_copy(tiles_remaining, le_room.tiles); // copy room tiles into tiles_remaining
ds_list_copy(all_hatches, le_room.hatches); // copy room tiles into all_hatches
ds_list_copy(all_doors, le_room.doors); // copy room tiles into all_doors
ds_list_copy(all_leaks, le_room.leaks); // copy leaks into all_leaks
var tile_queue = ds_queue_create();
var tiles_visited = ds_list_create();

// START flood fill

var origin_tile = ds_list_find_value(tiles_remaining, 0); // get the first tile
var or_i = scr_decode_grid_coord_i(origin_tile);
var or_j = scr_decode_grid_coord_j(origin_tile);
var tile_left = or_i*32 + 16;
var tile_top = or_j*32 + 16;
var tile_right = tile_left + 32;
var tile_bottom = tile_top + 32;
var min_left = tile_left;	// used to determine the bounding box (bb) of the batch.
var min_top = tile_top;
var max_right = tile_right;
var max_bottom = tile_bottom;

ds_queue_enqueue(tile_queue, origin_tile);
	
var connected_tiles_count = 0;
while(!ds_queue_empty(tile_queue))
{
	// pop the head
	var qh = ds_queue_head(tile_queue);
	ds_queue_dequeue(tile_queue);
	var has_been_visited = ds_list_find_index(tiles_visited, qh) > -1;
	if(has_been_visited)
	{
		continue; // skip the rest of the while loop
	}
	
	// MARK TILE
	var tile_i = scr_decode_grid_coord_i(qh);
	var tile_j = scr_decode_grid_coord_j(qh);
	var tile_left = tile_i*32 + 16;
	var tile_top = tile_j*32 + 16;
	var tile_right = tile_left + 32;
	var tile_bottom = tile_top + 32;
	if(tile_left<min_left) min_left = tile_left;
	if(tile_top<min_top) min_top = tile_top;
	if(tile_right>max_right) max_right = tile_right;
	if(tile_bottom>max_bottom) max_bottom = tile_bottom;
	connected_tiles_count++;
	ds_list_add(tiles_visited, qh);
	var qh_pos = ds_list_find_index(tiles_remaining, qh);
	ds_list_delete(tiles_remaining, qh_pos);
	// END MARK TILE
		
	var next_w_i = tile_i;
	var next_w_j = tile_j;
	var next_e_i = tile_i;
	var next_e_j = tile_j;
	next_w_i--;
	var next_west = scr_encode_grid_coord(next_w_i, next_w_j);
	next_e_i++;
	var next_east = scr_encode_grid_coord(next_e_i, next_e_j);
		
	// enqueue north
	var north = scr_encode_grid_coord(tile_i, tile_j-1);
	var north_is_in_remainder = ds_list_find_index(tiles_remaining, north) > -1;
	if(north_is_in_remainder)
	{
		ds_queue_enqueue(tile_queue, north);
	}
	// enqueue south
	var south = scr_encode_grid_coord(tile_i, tile_j+1);
	var south_is_in_remainder = ds_list_find_index(tiles_remaining, south) > -1;
	if(south_is_in_remainder)
	{
		ds_queue_enqueue(tile_queue, south);
	}
		
	// west
	var next_west_is_in_remainder = ds_list_find_index(tiles_remaining, next_west) > -1;
	while(next_west_is_in_remainder){ // being in the remainder means it's in the room and it hasn't been visited
		
		var north_of_next_west = scr_encode_grid_coord(next_w_i, next_w_j-1);
		var nnw_is_in_remainder = ds_list_find_index(tiles_remaining, north_of_next_west) > -1;
		if(nnw_is_in_remainder)
		{
			ds_queue_enqueue(tile_queue, north_of_next_west); // enqueu north
		}
			
		var south_of_next_west = scr_encode_grid_coord(next_w_i, next_w_j+1);
		var snw_is_in_remainder = ds_list_find_index(tiles_remaining, south_of_next_west) > -1;
		if(snw_is_in_remainder)
		{
			ds_queue_enqueue(tile_queue, south_of_next_west); // enqueu south
		}
		
		// MARK TILE
		var tile_left = next_w_i*32 + 16;
		var tile_top = next_w_j*32 + 16;
		var tile_right = tile_left + 32;
		var tile_bottom = tile_top + 32;
		if(tile_left<min_left) min_left = tile_left;
		if(tile_top<min_top) min_top = tile_top;
		if(tile_right>max_right) max_right = tile_right;
		if(tile_bottom>max_bottom) max_bottom = tile_bottom;
		connected_tiles_count++;
		ds_list_add(tiles_visited, next_west);
		var next_west_pos = ds_list_find_index(tiles_remaining, next_west);
		ds_list_delete(tiles_remaining, next_west_pos);
		// END MARK TILE
		
		next_w_i--;
		next_west = scr_encode_grid_coord(next_w_i, next_w_j);
		next_west_is_in_remainder = ds_list_find_index(tiles_remaining, next_west) > -1;
	}
		
	// east
	var next_east_is_in_remainder = ds_list_find_index(tiles_remaining, next_east) > -1;
	while(next_east_is_in_remainder){
			
		var north_of_next_east = scr_encode_grid_coord(next_e_i, next_e_j-1);
		var nne_is_in_remainder = ds_list_find_index(tiles_remaining, north_of_next_east) > -1;
		if(nne_is_in_remainder)
		{
			ds_queue_enqueue(tile_queue, north_of_next_east); // enqueu north
		}
			
		var south_of_next_east = scr_encode_grid_coord(next_e_i, next_e_j+1);
		var sne_is_in_remainder = ds_list_find_index(tiles_remaining, south_of_next_east) > -1;
		if(sne_is_in_remainder)
		{
			ds_queue_enqueue(tile_queue, south_of_next_east); // enqueu south
		}
		
		// MARK TILE
		var tile_left = next_e_i*32 + 16;
		var tile_top = next_e_j*32 + 16;
		var tile_right = tile_left + 32;
		var tile_bottom = tile_top + 32;
		if(tile_left<min_left) min_left = tile_left;
		if(tile_top<min_top) min_top = tile_top;
		if(tile_right>max_right) max_right = tile_right;
		if(tile_bottom>max_bottom) max_bottom = tile_bottom;
		connected_tiles_count++;
		ds_list_add(tiles_visited, next_east);
		var next_east_pos = ds_list_find_index(tiles_remaining, next_east);
		ds_list_delete(tiles_remaining, next_east_pos);
		// END MARK TILE
		
		next_e_i++;
		next_east = scr_encode_grid_coord(next_e_i, next_e_j);
		next_east_is_in_remainder = ds_list_find_index(tiles_remaining, next_east) > -1;
	}
}

// END flood fill

var tiles_remain = ds_list_size(tiles_remaining) > 0;

if(tiles_remain)
{
	// show_message("A discrepancy between the count of connected tiles and total tiles of a room was detected; connected " + string(connected_tiles_count) + " total: " + string(tile_count)); // DEBUG
	
	// make a room from remaining tiles:
	var get_layer = script_container_resolve(global.script_container, "get_layer_for");
	var rooms_layer = script_execute(get_layer, obj_room);
	var temp_room = instance_create_layer(0, 0, rooms_layer, obj_room); // this is just a dummy room without bb, used to pass remaining tiles along with gates
	with(temp_room)
	{
		oxygen_level = le_room.oxygen_level;
		temperature = le_room.temperature;
		ds_list_copy(tiles, tiles_remaining);
		ds_list_copy(hatches, all_hatches);
		ds_list_copy(doors, all_doors);
	}
	
	// part this room to make a new one from remaining tiles.
	scr_room_part(temp_room, true);
}

if(tiles_remain || force_new_room)
{
	// show_message("making a new room of size " + string(ds_list_size(tiles_visited))); // DEBUG
	
	// THIS IS WHERE THE ACTUAL PARTED ROOM IS CREATED
	var new_room = scr_create_room_with_tiles(tiles_visited, min_left, min_top, max_right, max_bottom);
	with(new_room)
	{
		oxygen_level = le_room.oxygen_level;
		temperature = le_room.temperature;
	}
	
	// Move gates to room
	scr_room_part_hatches(new_room, all_hatches);
	scr_room_part_doors(new_room, all_doors);
	scr_room_part_leaks(new_room, all_leaks);
	
	out_room = new_room;
	
	instance_destroy(le_room);
}

// destroy all helper ds
ds_list_destroy(tiles_remaining);
ds_list_destroy(all_hatches);
ds_list_destroy(all_doors);
ds_list_destroy(all_leaks);
ds_queue_destroy(tile_queue);
ds_list_destroy(tiles_visited);

return out_room;