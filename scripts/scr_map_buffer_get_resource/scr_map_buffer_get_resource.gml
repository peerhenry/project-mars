/// @param i
/// @param j
var arg_i = argument0;
var arg_j = argument1;

var map_val = scr_map_buffer_get_cell(arg_i, arg_j);
return (map_val >> 8);