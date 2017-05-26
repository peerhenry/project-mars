/// @param i
/// @param j
var arg_i = argument0;
var arg_j = argument1;
var arg_resource = argument2;

var map_val = scr_map_buffer_get_cell(arg_i, arg_j);
var new_val = (map_val & 255) + (arg_resource << 8);
scr_map_buffer_set_cell(arg_i, arg_j, new_val);
