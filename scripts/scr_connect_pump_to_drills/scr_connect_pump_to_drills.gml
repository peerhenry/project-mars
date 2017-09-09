var arg_instance = argument0;
debug_instance_type(arg_instance, obj_pump);
with(arg_instance)
{
	var adjacent_drills = scr_get_adjacent_instances(id, obj_drill);
	for(var n = 0; n < 4; n++) // ENWS
	{
		var next_drill = adjacent_drills[n];
		if(next_drill != noone)
		{
			if(scr_drill_has_water(next_drill) && scr_can_draw_power(arg_instance))
			{
				scr_set_grid_prop(arg_instance, macro_grid_water, macro_grid_prop_can_perform_role, true);
			}
		}
	}
}