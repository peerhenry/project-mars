/// @param inventory
/// @param item_type
function scr_inventory_has_space_for_item_type(argument0, argument1) {
	var arg_inventory = argument0;
	var arg_item_type = argument1;

	var size = scr_item_type_size(arg_item_type);
	if(size == 4) return scr_inventory_has_big_space(arg_inventory);
	if(size == 2) return scr_inventory_has_two_space(arg_inventory);
	return scr_inventory_has_space(arg_inventory);


}
