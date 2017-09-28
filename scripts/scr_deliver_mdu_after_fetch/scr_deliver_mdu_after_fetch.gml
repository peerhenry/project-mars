/// @description Either transfers mdu, or brings it to the construction
/// @param astronaut
var arg_astronaut = argument0;
var construction = arg_astronaut.construction;

if(construction[? construction_build_state] != construction_state.awaiting_mdus)
{
	scr_update_astro_props(arg_astronaut, noone, astronaut_action.idle);
	exit;
}

var reach_state = scr_get_reach_state(arg_astronaut, construction);

switch(reach_state)
{
	case macro_adjacent:
		scr_transfer_mdu(arg_astronaut, construction);
		break;
	case macro_reachable:
		scr_navigate_to_construction(arg_astronaut, construction);
		arg_astronaut.current_action = astronaut_action.delivering_mdu;
		break;
	case macro_unreachable:
		scr_update_astro_props(arg_astronaut, noone, astronaut_action.idle);
		break;
}