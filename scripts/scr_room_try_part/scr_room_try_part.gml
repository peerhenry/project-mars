/// @arg room
function scr_room_try_part(argument0) {
	var arg_room = argument0;

	var doors_to_update = ds_list_create();
	var hatches_to_update = ds_list_create();

	ds_list_copy(doors_to_update, arg_room.doors);
	ds_list_copy(hatches_to_update, arg_room.hatches);

	var partial_room = scr_room_part(arg_room, false);	// false: do not force new room creation if room does not part.
	var room_was_parted = partial_room != arg_room;		// arg_room is destroyed if partitioned.

	if(room_was_parted)
	{	
		for(var n = 0; n < ds_list_size(doors_to_update); n++)
		{
			var next_door = ds_list_find_value(doors_to_update, n);
			scr_door_connect_rooms(next_door);
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
