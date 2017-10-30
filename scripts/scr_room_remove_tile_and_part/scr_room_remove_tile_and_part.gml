/// @descirption subtracts a tile from a room, and part into different rooms
/// @param x
/// @param y
var arg_x = argument0;
var arg_y = argument1;

var le_room = scr_room_at(arg_x, arg_y);
if(le_room == noone) exit;

var arg_i = scr_rc_to_gi(arg_x);
var arg_j = scr_rc_to_gi(arg_y);
scr_remove_tile_from_room(le_room, arg_i, arg_j);

if(ds_list_size(le_room.tiles) == 0)
{
	instance_destroy(le_room);
	exit;
}

if(scr_room_cannot_part_here(le_room, arg_i, arg_j))
{
	exit;
}
else scr_room_try_part(le_room);