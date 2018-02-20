/// @arg x
/// @arg y
var c_x = argument0;
var c_y = argument1;
var explosion = instance_create_layer(c_x, c_y, macro_logic_layer, obj_explosion);
var rubble = instance_create_layer(c_x, c_y, macro_base_layer, obj_rubble);