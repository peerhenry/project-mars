/// @description Finalize construction
var existing_room = scr_room_at(x, y);
if(existing_room != noone) // get room that the new door is on
{
	scr_room_remove_tile_and_part(x, y);
}

scr_door_connect(id);