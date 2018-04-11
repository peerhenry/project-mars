var arg_bucket = argument0;
// actually no need to implement, drill connects to buckets during drill mine alarm
with(arg_bucket)
{
	var drills = scr_get_adjacent_instances(arg_bucket, obj_drill);
	for(var n = 0; n < 4; n++) // ENWS
	{
		var drill = drills[n];
		if(drill != noone && !drill.under_construction)
		{
			with(drill)
			{
				if(active_bucket == noone)
				{
					active_bucket = other.id;
					event_user(macro_event_drill_mine_check);
				}
			}
		}
	}
}