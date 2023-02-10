/// @arg {real} owner
function scr_get_construction_queue(argument0) {

	var arg_owner = argument0;
	return ds_map_find_value(global.construction_queue_map, arg_owner);


}
