var arg_drill = argument0;
with(arg_drill)
{
	var adjacent_pumps = scr_get_adjacent_instances(id, obj_pump);
	for(var n = 0; n < 4; n++) // ENWS
	{
		var next_pump = adjacent_pumps[n];
		if(next_pump != noone)
		{
			pump_count++;
			if(resource_instance != noone && resource_instance.object_index == obj_resource_water)
			{
				scr_set_grid_prop(next_pump, macro_grid_water, macro_grid_prop_can_perform_role, true);
			}
		}
	}
}