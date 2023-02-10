/// @param item_type
function scr_item_type_size(argument0) {
	var arg_item = argument0;
	if(arg_item == inv_space.rifle) return 2;
	else if(arg_item == inv_space.food || arg_item == inv_space.mdu) return 4;
	return 1;


}
