/// Adds room to given list if there is a basetile at given coordinates.
var arg_x = argument0;
var arg_y = argument1;
var roomlist = argument2;

if(instance_position(arg_x, arg_y, obj_base_tile) != noone){
	var target_room = scr_room_at(arg_x, arg_y);
	if(target_room != noone) ds_list_add(roomlist, target_room);
}