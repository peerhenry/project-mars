/// @description Give mdu to construction
/// @param astronaut
/// @param construction
var arg_astronaut = argument0;
var arg_construction = argument1;

scr_inventory_extract(arg_astronaut.inventory, macro_item_mdu);
scr_incr_construction_mdu(arg_construction);

// if the astronaut was delivering, decrement deliveries
if(arg_astronaut.current_action == astronaut_action.delivering_mdu)
{
	// decrement deliveries
	var deliveries_decr = arg_construction[? construction_mdu_deliveries] - 1;
	ds_map_replace(arg_construction, construction_mdu_deliveries, deliveries_decr);
	
	// set astronaut to idle
	arg_astronaut.current_action = astronaut_action.idle;
}

//DEBUG
var del = arg_construction[? construction_mdu_deliveries];
var state = arg_construction[? construction_build_state]
var mdu = arg_construction[?construction_required_mdu_remaining];
show_debug_message("after transfer: deliveries: " + string(del) + " state: " + string(state) + " remaining req mdus: " + string(mdu)) // DEBUg