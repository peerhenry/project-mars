/// @Description Creates a room without any tiles, just two doors.
/// @param door1
/// @param door2
var arg_door1 = argument0;
var arg_door2 = argument1;

var new_room = scr_create_room(arg_door1.x, arg_door1.y);
with(new_room)
{
	ds_list_add(doors, arg_door1, arg_door2);
	// Set oxygen level based on adjacent room.
	if(instance_exists(arg_door1.room1))oxygen_level = arg_door1.room1.oxygen_level;
	else oxygen_level = arg_door2.room2.oxygen_level;
}
return new_room;