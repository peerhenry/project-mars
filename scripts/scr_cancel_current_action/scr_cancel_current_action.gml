var arg_astronaut = argument0;

switch(arg_astronaut.current_action)
{
	case astronaut_action.delivering_mdu:
		var deliveries_decr = construction[? construction_mdu_deliveries] - 1;
		ds_map_replace(construction, construction_mdu_deliveries, deliveries_decr);
		break;
	case astronaut_action.constructing:
	case astronaut_action.moving_to_construction:
		ds_map_replace(construction, construction_build_state, construction_state.ready);
		break;
}

arg_astronaut.current_action = astronaut_action.idle;