var arg_instance = argument0;
debug_instance_type(arg_instance, obj_drill);
with(arg_instance)
{
	if(has_resource)
	{
		var adjacent_buckets = scr_get_adjacent_instances(id, obj_bucket);
		for(var n = 0; n < 4; n++) // ENWS
		{
			var bucket = adjacent_buckets[n];
			buckets[n] = bucket;
		}
	}
}