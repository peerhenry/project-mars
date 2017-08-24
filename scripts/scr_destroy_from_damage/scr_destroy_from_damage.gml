/// @param constructable
var arg_constructable = argument0;

var explosion = instance_create_layer(arg_constructable.x, arg_constructable.y, macro_logic_layer, obj_explosion);
instance_create_layer(arg_constructable.x, arg_constructable.y, macro_base_layer, obj_rubble);
instance_destroy(arg_constructable);