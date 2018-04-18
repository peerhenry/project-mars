/// @arg door
with(argument0)
{
	var room_remove_tile_and_part = resolve_script(script_container, "room_remove_tile_and_part");
	script_execute(room_remove_tile_and_part, x, y);
	scr_door_connect_rooms(id); // Connects door to rooms
}