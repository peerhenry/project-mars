/// @description Puts leaks from given list into the given room if the leak touches the room
/// @param room
/// @param leaks_list
var new_room = argument0;
var all_leaks = argument1;

for(var n=0; n < ds_list_size(all_leaks); n++)
{
	var next_leak = ds_list_find_value(all_leaks, n);
	if(scr_gate_touches_room(new_room, next_leak)) // works on leaks too
	{
		ds_list_add(new_room.leaks, next_leak);
	}
}