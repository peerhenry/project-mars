var arg_instance = argument0;
debug_instance_type(arg_instance, obj_drill);
with(arg_instance)
{
	if(has_resource && resource_instance.object_index == obj_resource_water)
	{
		var adjacent_pumps = scr_get_adjacent_instances(id, obj_pump);
		for(var n = 0; n < 4; n++) // ENWS
		{
			var next_pump = adjacent_pumps[n];
			if(next_pump != noone)
			{
				scr_set_grid_prop(next_pump, macro_grid_water, macro_grid_prop_can_perform_role, true);
			}
		}
	}
}