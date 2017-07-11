var constr_queue = global.construction_queue;
var construction_count = ds_list_size(constr_queue);
for(var n = 0; n < construction_count; n++)
{
	var next_construction = ds_list_find_value(constr_queue, n);
	var build_state = next_construction[construction_build_state];
	var prerequisite = next_construction[construction_prerequisite];
	var pass_from_prerequisite = true;
	if(is_array(prerequisite))
	{
		pass_from_prerequisite = prerequisite[construction_build_state] = construction_state.done;
	}
	if(build_state == construction_state.ready && pass_from_prerequisite)
	{
		var picked_up = scr_try_to_pick_up_construction(id, next_construction);
		if(picked_up) break;
	}
}