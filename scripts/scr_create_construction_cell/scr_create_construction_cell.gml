/// @arg i
/// @arg j
/// @arg layer
/// @arg action
/// @arg instance
/// @arg removal
scr_trace_script("scr_create_construction_cell", [argument0, argument1, argument2, argument3, argument4, argument5]);
var arg_i = argument0;
var arg_j = argument1;
var arg_layer = argument2;
var arg_action = argument3;
var arg_new_instance = argument4;
var arg_remove_object = argument5;

var new_construction_cell = ds_map_create();
ds_map_add(new_construction_cell, c_cell_layer, arg_layer);
ds_map_add(new_construction_cell, c_cell_i, arg_i);
ds_map_add(new_construction_cell, c_cell_j, arg_j);
ds_map_add(new_construction_cell, c_cell_new_instance, arg_new_instance);
ds_map_add(new_construction_cell, c_cell_object_to_remove, arg_remove_object);
return new_construction_cell;