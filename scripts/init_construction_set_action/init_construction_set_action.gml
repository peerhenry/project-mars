/// @param validation_i
/// @param validation_o
/// @param map_buffer_action
/// @param layer
/// @param object_to_add
/// @param object_to_remove
/// @param metal_cost

var arg_validation_i = argument0;
var arg_validation_o = argument1;
var arg_map_buffer_action = argument2;
var arg_layer = argument3;
var arg_object_to_add = argument4;
var arg_object_to_remove = argument5;
var arg_metal_cost = argument6; // obsolete

var build_action;
build_action[macro_metal_cost] = 0;
build_action[macro_object_to_remove] = arg_object_to_remove;
build_action[macro_object_to_add] = arg_object_to_add;
build_action[macro_layer] = arg_layer;
build_action[macro_map_buffer_action] = arg_map_buffer_action;
build_action[macro_validation_o] = arg_validation_o;
build_action[macro_validation_i] = arg_validation_i;

global.init_active_actions[@global.init_next_action_index] = build_action;
global.init_next_action_index++;