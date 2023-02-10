/// @Description Creates a room and adds a single tile.
/// @param x
/// @param y
function scr_create_room_with_tile(argument0, argument1) {
	var arg_x = argument0;
	var arg_y = argument1;

	var new_room = scr_create_room(arg_x, arg_y);
	var i = scr_rc_to_gi(arg_x);
	var j = scr_rc_to_gi(arg_y);
	scr_add_tile_to_room(new_room, i, j);

	return new_room;


}
