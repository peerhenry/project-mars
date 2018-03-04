/// @descr cancels action, unassigns task and cancels walking
/// @arg entity
var arg_entity = argument0;

with(arg_entity)
{
	switch(current_action)
	{
		case astronaut_action.fetching_mdu:
		case astronaut_action.delivering_mdu:
			var deliveries_decr = construction[? construction_mdu_deliveries] - 1;
			ds_map_replace(construction, construction_mdu_deliveries, deliveries_decr);
			construction = noone;
			break;
		case astronaut_action.constructing:
		case astronaut_action.moving_to_construction:
			ds_map_replace(construction, construction_build_state, construction_state.ready);
			construction = noone;
			break;
	}
	
	if(assigned_object != noone) scr_unassign_task(assigned_object);
	
	target = noone;
	current_action = astronaut_action.idle;
	
	if(path_exists(path)) scr_cancel_walking(id);
}