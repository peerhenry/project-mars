/// @arg room
/// @arg aggregate
function scr_room_is_connected_to_leak(argument0, argument1) {
	var arg_room = argument0;
	var arg_aggregate = argument1;

	var already_visited = ds_list_find_index(arg_aggregate, arg_room) != -1;
	if( already_visited ) return false;

	with(arg_room)
	{
		if(has_proper_leak) return true;
		// check if it has an open hatch
		for(var n = 0; n < ds_list_size(hatches); n++)
		{
			var next_hatch = ds_list_find_value(hatches, n);
			if(next_hatch.is_open) return true;
		}
	
		ds_list_add(arg_aggregate, arg_room);
		var adj_room_is_leaking = false;
		for(var n = 0; n < ds_list_size(doors); n++)
		{
			var next_door = ds_list_find_value(doors, n);
			if(next_door.is_open)
			{
				var other_room = next_door.room1;
				if(other_room == arg_room) other_room = next_door.room2;
				var other_room_is_leaking = scr_room_is_connected_to_leak(other_room, arg_aggregate);
				if(other_room_is_leaking) adj_room_is_leaking = true;
			}
		}
		return adj_room_is_leaking;
	}


}
