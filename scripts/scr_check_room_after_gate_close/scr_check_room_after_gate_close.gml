/// @arg room
function scr_check_room_after_gate_close(argument0) {
	var arg_room = argument0;
	var aggregate = ds_list_create();
	var leaking = scr_room_is_connected_to_leak(arg_room, aggregate);
	if(!leaking)
	{
		for(var n = 0; n < ds_list_size(aggregate); n++)
		{
			var next_room = ds_list_find_value(aggregate, n);
			next_room.oxygen_is_leaking = false;
		}
	}
	ds_list_destroy(aggregate);


}
