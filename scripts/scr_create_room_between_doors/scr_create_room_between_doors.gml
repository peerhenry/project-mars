/// @param door1
/// @param door2
var arg_door1 = argument0;
var arg_door2 = argument1;

var room_layer = layer_get_name(macro_rooms_layer);
var new_room = instance_create_layer(arg_door1.x, arg_door1.y, room_layer, obj_room);
with(new_room){
	bb_left = x;
	bb_top = y;
	bb_right = x;
	bb_bottom = y;
	ds_list_add(doors, arg_door1, arg_door2);
	if(instance_exists(arg_door1.room1))oxygen_level = arg_door1.room1.oxygen_level;
	else oxygen_level = arg_door2.room2.oxygen_level;
}

return new_room;