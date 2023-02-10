/// @description Puts doors from given list into the given room if the door touches the room
/// @param room
/// @param doors_list
function scr_room_part_doors(argument0, argument1) {
	var new_room = argument0;
	var all_doors = argument1;

	for(var n=0; n < ds_list_size(all_doors); n++)
	{
		var next_door = ds_list_find_value(all_doors, n);
		if(scr_gate_touches_room(new_room, next_door))
		{
			ds_list_add(new_room.doors, next_door);
		}
	}


}
