var arg_astronaut = argument0;

with(arg_astronaut)
{
	if(sleep_level < auto_sleep_level){
		// first try the nearest bed
		var nearest_bed = instance_nearest(x, y, obj_bed);
		var valid_bed = scr_can_assign(nearest_bed, arg_astronaut);
		if(valid_bed){
			var assigned = scr_assign(nearest_bed, id);
			if(assigned) return true;
		}
		
		// then try other beds
		with(obj_bed){
			var valid_bed = scr_can_assign(id, arg_astronaut);
			if(valid_bed){
				var assigned = scr_assign(id, arg_astronaut);
				if(assigned) return true;
			}
		}
	}
	return false;
}
