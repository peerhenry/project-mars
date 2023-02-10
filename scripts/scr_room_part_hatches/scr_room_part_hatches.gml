/// @description Puts hatches from given list into the given room if the hatch touches the room
/// @param room
/// @param hatch_list
function scr_room_part_hatches(argument0, argument1) {
	var new_room = argument0;
	var all_hatches = argument1;

	for(var n=0; n < ds_list_size(all_hatches); n++){
		var next_hatch = ds_list_find_value(all_hatches, n);
		if(scr_gate_touches_room(new_room, next_hatch))
		{
			ds_list_add(new_room.hatches, next_hatch);
		}
	}


}
