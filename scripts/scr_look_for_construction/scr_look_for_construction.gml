/// @param astronaut

// scr_trace("scr_look_for_construction");
var arg_astronaut = argument0;
debug_instance_inherits(arg_astronaut, obj_astronaut);

var found_one = false;
var constr_queue = scr_get_construction_queue(arg_astronaut.owner);
if(constr_queue == noone || is_undefined(constr_queue))
{
	scr_warn("Construction queue was noone or undefined for owner: " + string(arg_astronaut.owner));
	return false;
}

var construction_count = ds_list_size(constr_queue);
// scr_trace("construction_count: " + string(construction_count));
for(var n = 0; n < construction_count; n++)
{
	if(found_one) return true;
	
	// Check if construction has a prerequisite construction
	var next_construction = ds_list_find_value(constr_queue, n);
	var build_state = ds_map_find_value(next_construction, construction_build_state);
	if( build_state == construction_state.picked_up ) continue;
	var prerequisite = ds_map_find_value(next_construction, construction_prerequisite);
	
	// The prerequisite must either be gone or done in order for this one to be picked up
	var pass_from_prerequisite = true;
	if(ds_exists(prerequisite, ds_type_map))
	{
		pass_from_prerequisite = ds_map_find_value(prerequisite, construction_build_state) == construction_state.done;
	}
	
	// The astronaut must also be able to reach the construction
	var get_reach_state = script_container_resolve(arg_astronaut.script_container, "get_reach_state");
	var reach = script_execute(get_reach_state, arg_astronaut, next_construction);
	
	/*
	scr_trace("build_state: " + string(build_state));
	scr_trace("prerequisite: " + string(prerequisite));
	scr_trace("pass_from_prerequisite: " + string(pass_from_prerequisite));
	scr_trace("reach_state: " + string(reach_state));
	*/
	
	if(reach != reach_state.unreachable && pass_from_prerequisite)
	{
		switch(build_state)
		{
			case construction_state.awaiting_mdus:
				found_one = scr_make_mdu_delivery(arg_astronaut, next_construction, reach);
				break;
			case construction_state.ready:
				found_one = scr_go_construct(arg_astronaut, next_construction, reach);
				break;
		}
	}
}

return found_one;