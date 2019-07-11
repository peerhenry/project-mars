/// @description Give mdu to construction
/// @param script_container
/// @param astronaut
/// @param construction
var arg_script_container = argument0;
var arg_astronaut = argument1;
var arg_construction = argument2;

var mdu = scr_inventory_extract(arg_astronaut.inventory, item_type.mdu);
instance_destroy(mdu);
scr_incr_construction_mdu(arg_script_container, arg_construction);

// if the astronaut was delivering, decrement deliveries
if(arg_astronaut.current_action == astronaut_action.delivering_mdu)
{
	// decrement deliveries
	var deliveries_decr = arg_construction[? construction_mdu_deliveries] - 1;
	ds_map_replace(arg_construction, construction_mdu_deliveries, deliveries_decr);
	
	// set astronaut to idle
	arg_astronaut.current_action = astronaut_action.idle;
}