show_debug_message("CHECKING GATE"); // DEBUG
if(object_index == obj_door)
{
	show_debug_message("ITS DOOR"); // DEBUG
	if( room1.oxygen_is_leaking ) scr_check_room_after_gate_close(room1);
	if( room2.oxygen_is_leaking ) scr_check_room_after_gate_close(room2);
}
else if(object_index == obj_hatch)
{
	show_debug_message("ITS HATCH");
	if( base_room.oxygen_is_leaking ) scr_check_room_after_gate_close(base_room);
}