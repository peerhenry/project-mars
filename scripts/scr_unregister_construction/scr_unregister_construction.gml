/// @arg construction
var arg_construction = argument0;
var construction_queue = scr_get_construction_queue(arg_construction[? construction_owner]);
if(construction_queue != noone)
{
	var index = ds_list_find_index(construction_queue, arg_construction);
	ds_list_delete(construction_queue, index);
}
else
{
	scr_warn("Trying to unregister a construction that was not registered.");
}