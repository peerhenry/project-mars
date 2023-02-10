/// @description Adds construction to the relevant construction queue
/// @arg construction
function scr_register_new_construction(argument0) {
	debug_type(argument0, macro_type_map);
	var arg_construction = argument0;
	var owner = arg_construction[? construction_owner];
	var cq = scr_get_construction_queue(owner);
	if(cq != noone) ds_list_add(cq, arg_construction);
	else scr_warn("There is no construction queue for owner: " + string(owner));


}
