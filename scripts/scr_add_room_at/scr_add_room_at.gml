/// @description Adds room to given list if there is a room at given coordinates.
/// @param x
/// @param y
/// @param list
function scr_add_room_at(argument0, argument1, argument2) {
	var arg_x = argument0;
	var arg_y = argument1;
	var roomlist = argument2;
	scr_trace("scr_add_room_at(" + string(arg_x) + ", " + string(arg_y) + ")");
	var target_room = scr_room_at(arg_x, arg_y);
	if(target_room != noone) ds_list_add(roomlist, target_room);


}
