var arg_bucket = argument0;
// actually no need to implement, drill connects to buckets during drill mine alarm
with(arg_bucket)
{
	var drills = scr_get_adjacent_instances_at(x, y, obj_drill);
	for(var n = 0; n < 4; n++) // ENWS
	{
		var drill = drills[n];
		if(drill != noone)
		{
			
		}
	}
}