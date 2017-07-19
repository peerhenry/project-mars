/// @description called on creation of drill or pump
/// @param instance
var arg_instance = argument0;

if(arg_instance.object_index == obj_pump)
{
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
					scr_set_grid_prop(arg_instance, macro_grid_water, macro_grid_component_can_perform_role, true);
				}
			}
		}
	}
}
else if(arg_instance.object_index == obj_drill)
{
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
					scr_set_grid_prop(arg_instance, macro_grid_water, macro_grid_component_can_perform_role, true);
				}
			}
		}
	}
}