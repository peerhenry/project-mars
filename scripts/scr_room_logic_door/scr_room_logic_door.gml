var new_door = argument0;

var existing_room = scr_room_at(new_door.x, new_door.y);
if(existing_room != noone) // get room that the new door is on
{
	scr_room_remove_tile_and_part(new_door.x, new_door.y);
}

scr_door_connect(new_door);