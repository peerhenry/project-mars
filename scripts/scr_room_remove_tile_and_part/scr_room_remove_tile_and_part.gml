/// @descirption subtracts a tile from a room, and part into different rooms
/// @param x
/// @param y
var arg_x = argument0;
var arg_y = argument1;
var arg_i = scr_rc_to_gi(arg_x);
var arg_j = scr_rc_to_gi(arg_y);

var le_room = scr_room_at(arg_x, arg_y);
if(le_room == noone) exit;
scr_remove_tile_from_room(le_room, arg_i, arg_j);

if(ds_list_size(le_room.tiles) == 0)
{
	instance_destroy(le_room);
	return;
}

if(scr_room_could_part_at(le_room, arg_x, arg_y))
{
	var doors_to_update = ds_list_create();
	var hatches_to_update = ds_list_create();
	
	ds_list_copy(doors_to_update, le_room.doors);
	ds_list_copy(hatches_to_update, le_room.hatches);
	
	var partial_room = scr_room_part(le_room, false);	// false: do not force new room creation if room does not part.
	var room_was_parted = partial_room != le_room;		// le_room is destroyed if partitioned.
	
	if(room_was_parted)
	{
		for(var n = 0; n < ds_list_size(doors_to_update); n++)
		{
			var next_door = ds_list_find_value(doors_to_update, n);
			scr_door_connect(next_door);
		}
		
		for(var n = 0; n < ds_list_size(hatches_to_update); n++)
		{
			var next_hatch = ds_list_find_value(hatches_to_update, n);
			scr_hatch_connect(next_hatch);
		}
	}
	
	ds_list_destroy(doors_to_update);
	ds_list_destroy(hatches_to_update);
}