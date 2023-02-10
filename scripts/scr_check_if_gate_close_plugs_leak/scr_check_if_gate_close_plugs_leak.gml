function scr_check_if_gate_close_plugs_leak() {
	if(object_index == obj_door)
	{
		if( room1.oxygen_is_leaking ) scr_check_room_after_gate_close(room1);
		if( room2.oxygen_is_leaking ) scr_check_room_after_gate_close(room2);
	}
	else if(object_index == obj_hatch)
	{
		if( base_room.oxygen_is_leaking ) scr_check_room_after_gate_close(base_room);
	}


}
