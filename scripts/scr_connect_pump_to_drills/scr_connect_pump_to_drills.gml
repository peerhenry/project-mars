/// @arg pump
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
			var can_draw_power = resolve_execute(script_container, "can_draw_power", arg_pump);
			/*show_debug_message("connecting in scr_connect_pump_to_drills");
			show_debug_message("now resolving can draw power for pump");
			
			show_debug_message("the true bool is: " + string(true));
			show_debug_message("can pump draw power " + string(can_draw_power));
			show_debug_message("scr_drill_has_water(next_drill) " + string(scr_drill_has_water(next_drill)));
			
			show_debug_message("OK OK OK");
			var result1 = script_execute(scr_mock_return_true);
			show_debug_message("result1: " + string(result1));
			var result2 = script_execute(scr_mock_return_true, arg_pump);
			show_debug_message("result2: " + string(result2));
			
			var again1 = resolve_execute(script_container, "can_draw_power");
			show_debug_message("again1: " + string(again1));
			var again2 = resolve_execute(script_container, "can_draw_power", arg_pump);
			show_debug_message("again2: " + string(again2));
			
			var le_script = resolve(script_container, "can_draw_power");
			//show_debug_message("can_draw_power script name: " + script_get_name(le_script));
			var er1 = script_execute(le_script);
			var er2 = script_execute(le_script, arg_pump);
			show_debug_message("er1: " + string(er1));
			show_debug_message("er2: " + string(er2)); //*/
			
			if(scr_drill_has_water(next_drill) && can_draw_power)
			{
				scr_set_grid_prop(arg_pump, macro_grid_water, macro_grid_prop_can_perform_role, true);
			}
		}
	}
}