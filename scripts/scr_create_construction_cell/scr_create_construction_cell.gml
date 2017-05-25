var arg_i = argument0;
var arg_j = argument1;
var arg_action = argument2;
var arg_new_instance = argument3;
var arg_remove_object = argument4;

var new_construction_cell;
new_construction_cell[c_cell_map_buffer_action] = arg_action; // highest number goes first
new_construction_cell[c_cell_i] = arg_i ;
new_construction_cell[c_cell_j] = arg_j;
new_construction_cell[c_cell_new_instance] = arg_new_instance;
new_construction_cell[c_cell_object_to_remove] = arg_remove_object;

return new_construction_cell;