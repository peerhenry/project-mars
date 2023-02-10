/// @arg drill
function scr_connect_drill_to_buckets(argument0) {
	var arg_drill = argument0;
	debug_instance_type(arg_drill, obj_drill);
	with(arg_drill)
	{
		if(resource_instance != noone && scr_instance_inherits(resource_instance, obj_resource_solid))
		{
			active_bucket = in(f_drill_mine, "find_bucket_with_space", arg_drill);
			if(active_bucket != noone) is_active = true;
		}
	}


}
