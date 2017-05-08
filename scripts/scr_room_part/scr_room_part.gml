var le_room = argument0;
var force_redo = argument1; // will force creation of a new room even if room is connected

var tiles_remaining = ds_list_create();
var doors_remaining = ds_list_create();
var hatches_remaining = ds_list_create();
ds_list_copy(tiles_remaining, le_room.tiles); // copy room tiles into tiles_remaining
ds_list_copy(hatches_remaining, le_room.hatches); // copy room tiles into tiles_remaining
ds_list_copy(doors_remaining, le_room.doors); // copy room tiles into tiles_remaining
var tile_queue = ds_queue_create();
var tiles_visited = ds_list_create();

var tile_count = ds_list_size(tiles_remaining);
var origin_tile = ds_list_find_value(tiles_remaining, 0); // get the first tile
var or_i = scr_room_tile_decode_i(origin_tile);
var or_j = scr_room_tile_decode_j(origin_tile);
var tile_left = or_i*32 + 16;
var tile_top = or_j*32 + 16;
var tile_right = tile_left + 32;
var tile_bottom = tile_top + 32;
var min_left = tile_left;
var min_top = tile_top;
var max_right = tile_right;
var max_bottom = tile_bottom;

ds_queue_enqueue(tile_queue, origin_tile);
	
var connected_tiles_count = 0;
while(!ds_queue_empty(tile_queue))
{
	// dequeue the head
	var qh = ds_queue_head(tile_queue);
	ds_queue_dequeue(tile_queue);
	var has_been_visited = ds_list_find_index(tiles_visited, qh) > -1;
	if(has_been_visited){
		continue;
	}
	
	// MARK
	var tile_i = scr_room_tile_decode_i(qh);
	var tile_j = scr_room_tile_decode_j(qh);
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
	var tile_pos = ds_list_find_index(tiles_remaining, qh);
	ds_list_delete(tiles_remaining, tile_pos);
		
	var next_w_i = tile_i;
	var next_w_j = tile_j;
	var next_e_i = tile_i;
	var next_e_j = tile_j;
	next_w_i--;
	var next_west = scr_room_tile_encode(next_w_i, next_w_j);
	next_e_i++;
	var next_east = scr_room_tile_encode(next_e_i, next_e_j);
		
	// enqueue north
	var north = scr_room_tile_encode(tile_i, tile_j-1);
	var north_is_in_room = ds_list_find_index(tiles_remaining, north) > -1;
	var north_has_been_visited = ds_list_find_index(tiles_visited, north) > -1;
	if(north_is_in_room && !north_has_been_visited)
	{
		ds_queue_enqueue(tile_queue, north);
	}
	// enqueue south
	var south = scr_room_tile_encode(tile_i, tile_j+1);
	var south_is_in_room = ds_list_find_index(tiles_remaining, south) > -1;
	var south_has_been_visited = ds_list_find_index(tiles_visited, south) > -1;
	if(south_is_in_room && !south_has_been_visited)
	{
		ds_queue_enqueue(tile_queue, south);
	}
		
	// west
	while(ds_list_find_index(tiles_visited, next_west) == -1 && ds_list_find_index(tiles_remaining, next_west) > -1){
		
		var north_of_next_west = scr_room_tile_encode(next_w_i, next_w_j-1);
		var nnw_is_in_room = ds_list_find_index(tiles_remaining, north_of_next_west) > -1;
		var nnw_has_been_visited = ds_list_find_index(tiles_visited, north_of_next_west) > -1;
		if(nnw_is_in_room && !nnw_has_been_visited)
		{
			ds_queue_enqueue(tile_queue, north_of_next_west); // enqueu north
		}
			
		var south_of_next_west = scr_room_tile_encode(next_w_i, next_w_j+1);
		var snw_is_in_room = ds_list_find_index(tiles_remaining, south_of_next_west) > -1;
		var snw_has_been_visited = ds_list_find_index(tiles_visited, south_of_next_west) > -1;
		if(snw_is_in_room && !snw_has_been_visited)
		{
			ds_queue_enqueue(tile_queue, south_of_next_west); // enqueu south
		}
		
		// MARK
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
		
		next_w_i--;
		next_west = scr_room_tile_encode(next_w_i, next_w_j);
	}
		
	// east
	while(ds_list_find_index(tiles_visited, next_east) == -1 && ds_list_find_index(tiles_remaining, next_east) > -1){
			
		var north_of_next_east = scr_room_tile_encode(next_e_i, next_e_j-1);
		var nne_is_in_room = ds_list_find_index(tiles_remaining, north_of_next_east) > -1;
		var nne_has_been_visited = ds_list_find_index(tiles_visited, north_of_next_east) > -1;
		if(nne_is_in_room && !nne_has_been_visited)
		{
			ds_queue_enqueue(tile_queue, north_of_next_east); // enqueu north
		}
			
		var south_of_next_east = scr_room_tile_encode(next_e_i, next_e_j+1);
		var sne_is_in_room = ds_list_find_index(tiles_remaining, south_of_next_east) > -1;
		var sne_has_been_visited = ds_list_find_index(tiles_visited, south_of_next_east) > -1;
		if(sne_is_in_room && !sne_has_been_visited)
		{
			ds_queue_enqueue(tile_queue, south_of_next_east); // enqueu south
		}
		
		// MARK
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
		
		next_e_i++;
		next_east = scr_room_tile_encode(next_e_i, next_e_j);
	}
}

if(connected_tiles_count != tile_count)	// we're gonna make a new room from remaining tiles through scr_room_part
{
	// make a room from remaining tiles:
	if(ds_list_size(tiles_remaining) > 0)
	{
		// show_message("remaining room has size " + string(ds_list_size(tiles_remaining))); // DEBUG
		var room_layer = layer_get_name("rooms");
		var temp_room = instance_create_layer(0, 0, room_layer, obj_room); // this is just a temporary new room without a bb.
		with(temp_room){
			oxygen_level = le_room.oxygen_level;
			temperature = le_room.temperature;
			ds_list_copy(tiles, tiles_remaining);
			ds_list_copy(hatches, hatches_remaining);
			ds_list_copy(doors, doors_remaining);
		}
		ds_list_destroy(tiles_remaining);
		
		// show_message("The created room from remaining tiles has size " + string(ds_list_size(room_from_remaining_tiles.tiles))); // DEBUG
		scr_room_part(temp_room, true);
	}
}

if(connected_tiles_count != tile_count || force_redo){
	// show_message("A discrepancy between the count of connected tiles and total tiles of a room was detected; connected " + string(connected_tiles_count) + " total: " + string(tile_count)); // DEBUG
	// show_message("making a new room of size " + string(ds_list_size(tiles_visited))); // DEBUG
	var new_room = scr_room_new_from_tiles(tiles_visited, min_left, min_top, max_right, max_bottom);
	with(new_room){
		oxygen_level = le_room.oxygen_level;
		temperature = le_room.temperature;
	}
	
	// move hatches to room
	for(var n=0; n<ds_list_size(hatches_remaining); n++){
		var next_hatch = ds_list_find_value(hatches_remaining, n);
		if(
			point_in_rectangle(next_hatch.x + 32, next_hatch.y, min_left, min_top, max_right, max_bottom)
			|| point_in_rectangle(next_hatch.x - 32, next_hatch.y, min_left, min_top, max_right, max_bottom)
			|| point_in_rectangle(next_hatch.x, next_hatch.y + 32, min_left, min_top, max_right, max_bottom)
			|| point_in_rectangle(next_hatch.x, next_hatch.y - 32, min_left, min_top, max_right, max_bottom))
		{
			ds_list_add(new_room.hatches, next_hatch);
		}
	}
	
	with(le_room) instance_destroy();
	
	return new_room;
}

return le_room;