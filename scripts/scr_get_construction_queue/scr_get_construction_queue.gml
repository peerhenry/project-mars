/// @arg {real} owner
// todo: use map
debug_type(argument0, macro_type_real);
var arg_owner = argument0;

if(arg_owner == macro_player)
{
	return global.construction_queue;
}
return noone;

// return ds_map_find_value(global.construction_queues, arg_owner);