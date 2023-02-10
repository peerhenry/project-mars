/// @description Join 2 rooms
/// @param x
/// @param y
/// @param room1
/// @param room2
function scr_room_join(argument0, argument1, argument2, argument3) {
	var arg_x = argument0;
	var arg_y = argument1;
	var room1 = argument2;
	var room2 = argument3;

	if(room1 == room2){
		scr_room_expand(room1, arg_x, arg_y);
		return room1;
	}
	else{
		// create new room, destroy the old rooms
	
		var size1 = ds_list_size(room1.tiles);
		var size2 = ds_list_size(room2.tiles);
		var totalsize = size1 + size2;
		var new_oxygen_level = (room1.oxygen_level * size1 + room2.oxygen_level * size2)/max(totalsize,1);
		var new_temperature = (room1.temperature * size1 + room2.temperature * size2)/max(totalsize,1);
	
		var new_room = scr_create_room_with_tile(arg_x, arg_y);
	
		with(new_room){
			oxygen_level = new_oxygen_level;
			temperature = new_temperature;
			bb_left = min(room1.bb_left, room2.bb_left);
			bb_top = min(room1.bb_top, room2.bb_top);
			bb_right = max(room1.bb_right, room2.bb_right);
			bb_bottom = max(room1.bb_bottom, room2.bb_bottom);
		
			// add tiles
			for(var n=0; n<ds_list_size(room1.tiles); n++) {
				ds_list_add(tiles, ds_list_find_value(room1.tiles, n));
			}
			for(var n=0; n<ds_list_size(room2.tiles); n++) {
				ds_list_add(tiles, ds_list_find_value(room2.tiles, n));
			}
		
			// add doors
			ds_list_copy(doors, room1.doors);
			for(var n=0; n<ds_list_size(room2.doors); n++) {
				var next_door = ds_list_find_value(room2.doors, n);
				if(ds_list_find_index(doors, next_door ) < 0) // prevent duplicate doors from being added.
				{
					ds_list_add(doors, next_door);
				}
			}
		
			// add hatches
			for(var n=0; n<ds_list_size(room1.hatches); n++) {
				ds_list_add(hatches, ds_list_find_value(room1.hatches, n));
			}
			for(var n=0; n<ds_list_size(room2.hatches); n++) {
				ds_list_add(hatches, ds_list_find_value(room2.hatches, n));
			}
		
			// add leaks
			for(var n=0; n<ds_list_size(room1.leaks); n++) {
				ds_list_add(leaks, ds_list_find_value(room1.leaks, n));
			}
			for(var n=0; n<ds_list_size(room2.leaks); n++) {
				ds_list_add(leaks, ds_list_find_value(room2.leaks, n));
			}
		}
	
		// destroy rooms 1 and 2
		instance_destroy(room1);
		instance_destroy(room2);
	
		scr_room_reconnect_gates(new_room);
		return new_room;
	}


}
