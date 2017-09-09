/// @description Adds construction to the relevant construction queue
/// @arg construction
debug_type(argument0, macro_type_map);
var arg_construction = argument0;
var cq = scr_get_construction_queue(arg_construction[? construction_owner]);
ds_list_add(cq, arg_construction);