//scr_trace("scr_create_build_cell");
var arg_i = argument0;
var arg_j = argument1;
var arg_map_buffer_action = argument2;
var arg_layer = argument3;
var arg_object = argument4;
var arg_remove_object = argument5;
var arg_cost = argument6;
var arg_sprite_override = argument7;
var arg_image_index = argument8;
var arg_angle_override = argument9;
var arg_required_object = argument10;

var new_build_cell;
new_build_cell[build_cell_required_object] = arg_required_object;
new_build_cell[build_cell_object_angle] = arg_angle_override; // highest array index first
new_build_cell[build_cell_cost] = arg_cost;
new_build_cell[build_cell_map_buffer_action] = arg_map_buffer_action;
new_build_cell[build_cell_i] = arg_i;
new_build_cell[build_cell_j] = arg_j;
new_build_cell[build_cell_object_to_add] = arg_object;
new_build_cell[build_cell_layer] = arg_layer;
new_build_cell[build_cell_object_to_remove] = arg_remove_object;
new_build_cell[build_cell_object_sprite] = arg_sprite_override;
new_build_cell[build_cell_object_image] = arg_image_index;
return new_build_cell;