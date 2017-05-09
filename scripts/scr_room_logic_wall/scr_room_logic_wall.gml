var new_wall = argument0;

// subtracts a tile from a room, and part into different rooms

var le_room = scr_room_at(new_wall.x, new_wall.y);
var i = scr_rc_to_gi(new_wall.x);
var j = scr_rc_to_gi(new_wall.y);
scr_remove_tile_from_room(le_room, i, j);

if(ds_list_size(le_room.tiles) == 0)
{
	instance_destroy(le_room);
	return;
}

if(scr_room_could_part_at(le_room, new_wall.x, new_wall.y))
{
	var doors_to_update = ds_list_create();
	ds_list_copy(doors_to_update, le_room.doors);
	var partial_room = scr_room_part(le_room, false); // false: do not force new room creation if room does not part.
	var room_was_parted = partial_room != le_room; // le_room is destroyed if partitioned.
	if(room_was_parted)
	{
		for(var n = 0; n < ds_list_size(doors_to_update); n++)
		{
			var next_door = ds_list_find_value(doors_to_update, n);
			scr_door_connect(next_door);
		}
	}
	ds_list_destroy(doors_to_update);
}