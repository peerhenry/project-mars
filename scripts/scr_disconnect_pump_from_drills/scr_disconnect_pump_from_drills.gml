/// @arg pump
function scr_disconnect_pump_from_drills(argument0) {
	var arg_pump = argument0;
	debug_instance_type(arg_pump, obj_pump);
	with(arg_pump)
	{
		var adjacent_drills = scr_get_adjacent_instances(id, obj_drill);
		for(var n = 0; n < 4; n++) // ENWS
		{
			var next_drill = adjacent_drills[n];
			if(next_drill != noone)
			{
				next_drill.pump_count--;
				with(next_drill) event_user(macro_event_drill_mine_check);
			}
		}
	}


}
