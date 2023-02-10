/// @arg x
/// @arg y
/// @arg obj_index
function scr_instance_create(argument0, argument1, argument2) {
	var arg_x = argument0;
	var arg_y = argument1;
	var arg_obj_index = argument2;
	var container = global.script_container;
	var get_layer = script_container_resolve(container, "get_layer_for");
	var use_layer = script_execute(get_layer, arg_obj_index);
	return instance_create_layer(arg_x, arg_y, use_layer, arg_obj_index);


}
