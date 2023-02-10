/// @param astronaut
/// @param construction
/// @param reach_state
function scr_make_mdu_delivery(argument0, argument1, argument2) {
	var arg_astronaut = argument0;
	var arg_construction = argument1;
	var arg_reach_state = argument2;

	var deliveries = arg_construction[? construction_mdu_deliveries];
	var required = arg_construction[? construction_required_mdu_remaining];
	if(required > deliveries)
	{
		if(scr_inventory_has_item_type(arg_astronaut.inventory, inv_space.mdu))
		{
			scr_deliver_mdu(arg_astronaut.script_container, arg_astronaut, arg_construction, arg_reach_state);
			return true;
		}
		else 
		{
			var is_fetching = scr_fetch_mdu(arg_astronaut, arg_construction);
			return is_fetching;
		}
	}
	return false;


}
