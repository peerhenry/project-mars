if(!is_walking && current_action = astronaut_action.idle)
{
	// do an autotask
	
	var constr_queue = global.construction_queue;
	var construction_count = ds_list_size(constr_queue);
	for(var n = 0; n < construction_count; n++)
	{
		var next_construction = ds_list_find_value(constr_queue, n);
		var build_state = next_construction[construction_build_state];
		if(build_state == build_state.ready)
		{
			var picked_up = scr_navigate_to_construction(id, next_construction);
			if(picked_up) break;
		}
	}
	
}

alarm[1] = 30 + round(random_range(-5,5));