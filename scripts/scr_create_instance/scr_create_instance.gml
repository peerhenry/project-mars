/// @description creates an instance at given location in proper layer
/// @arg x
/// @arg y
/// @arg object_index
var arg_x = argument0;
var arg_y = argument1;
var obj_ind = argument2;

var get_layer = script_container_resolve(global.script_container, "get_layer_for");
var lid = script_execute(get_layer, obj_ind);
return instance_create_layer(arg_x, arg_y, lid, obj_ind);