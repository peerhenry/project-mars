/// Join 3 rooms
var arg_x = argument0;
var arg_y = argument1;
var room1 = argument2;
var room2 = argument3;
var room3 = argument4;

if(room1 == room2 && room2 == room3){ // there is only one room
	scr_room_expand(room1, arg_x, arg_y);
}
else if(room1 == room2 || room1 == room2) // room 1 is not unique
{
	scr_room_join(arg_x, arg_y, room2, room3);
}
else if(room2 == room1 || room2 == room1) // room 2 is not unique
{
	scr_room_join(arg_x, arg_y, room1, room3);
}
else if(room1 == room2 || room1 == room3) // room 3 is not unique
{
	scr_room_join(arg_x, arg_y, room1, room2);
}
else{
	// create new room, destroy the old rooms
	
	var size1 = ds_list_size(room1.tiles);
	var size2 = ds_list_size(room2.tiles);
	var size3 = ds_list_size(room3.tiles);
	var totalsize = size1 + size2 + size3;
	var new_oxygen_level = (room1.oxygen_level * size1 + room2.oxygen_level * size2 + room3.oxygen_level * size3)/totalsize;
	var new_temperature = (room1.temperature * size1 + room2.temperature * size2 + room3.temperature * size3)/totalsize;
	
	var new_room = scr_create_room_with_tile(arg_x, arg_y);
	
	with(new_room){
		oxygen_level = new_oxygen_level;
		temperature = new_temperature;
		bb_left = min(room1.bb_left, room2.bb_left, room3.bb_left);
		bb_top = min(room1.bb_top, room2.bb_top, room3.bb_top);
		bb_right = max(room1.bb_right, room2.bb_right, room3.bb_right);
		bb_bottom = max(room1.bb_bottom, room2.bb_bottom, room3.bb_bottom);
		
		// add tiles
		for(var n=0; n<ds_list_size(room1.tiles); n++) {
			ds_list_add(tiles, ds_list_find_value(room1.tiles, n));
		}
		for(var n=0; n<ds_list_size(room2.tiles); n++) {
			ds_list_add(tiles, ds_list_find_value(room2.tiles, n));
		}
		for(var n=0; n<ds_list_size(room3.tiles); n++) {
			ds_list_add(tiles, ds_list_find_value(room3.tiles, n));
		}
		
		// add doors
		ds_list_copy(doors, room1.doors);
		for(var n=0; n<ds_list_size(room2.doors); n++) {
			var next_door = ds_list_find_value(room2.doors, n);
			if(ds_list_find_index(doors, next_door ) == -1)
			{
				ds_list_add(doors, next_door);
			}
		}
		for(var n=0; n<ds_list_size(room3.doors); n++) {
			var next_door = ds_list_find_value(room3.doors, n);
			if(ds_list_find_index(doors, next_door ) == -1)
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
		for(var n=0; n<ds_list_size(room3.hatches); n++) {
			ds_list_add(hatches, ds_list_find_value(room3.hatches, n));
		}
	}
	
	// destroy rooms 1, 2 and 3
	with(room1) instance_destroy();
	with(room2) instance_destroy();
	with(room3) instance_destroy();
	
	scr_room_reconnect_gates(new_room);
}