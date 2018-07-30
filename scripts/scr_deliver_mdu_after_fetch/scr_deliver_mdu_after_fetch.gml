/// @description Either transfers mdu, or brings it to the construction
/// @param astronaut
var arg_astronaut = argument0;
var construction = arg_astronaut.construction;
var script_container = arg_astronaut.script_container;

if(construction == noone || construction[? construction_build_state] != construction_state.awaiting_mdus)
{
	scr_update_astro_construction_action(arg_astronaut, noone, astronaut_action.idle);
	arg_astronaut.autotasking = false;
	exit;
}

var state = scr_get_reach_state(arg_astronaut, construction);

switch(state)
{
	case reach_state.adjacent:
		scr_transfer_mdu(script_container, arg_astronaut, construction);
		break;
	case reach_state.reachable:
		scr_navigate_to_construction(arg_astronaut, construction);
		arg_astronaut.current_action = astronaut_action.delivering_mdu;
		break;
	case reach_state.unreachable:
		var deliveries_decr = construction[? construction_mdu_deliveries] - 1;
		ds_map_replace(construction, construction_mdu_deliveries, deliveries_decr);
		scr_update_astro_construction_action(arg_astronaut, noone, astronaut_action.idle);
		arg_astronaut.autotasking = false;
		break;
}