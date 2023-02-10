/// @param inventory
function scr_inventory_has_space(argument0) {
	var arg_inventory = argument0;
	return scr_inventory_has_item_type(arg_inventory, inv_space.empty);


}
