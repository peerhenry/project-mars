/// @arg owner
function scr_get_first_queud_construction(argument0) {
	var arg_owner = argument0;
	var cq = scr_get_construction_queue(arg_owner);
	if(cq != noone && ds_list_size(cq))
	{
		return ds_list_find_value(cq, 0);
	}
	return noone;


}
