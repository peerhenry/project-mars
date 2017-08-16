/// @param constructable
var arg_constructable = argument0;

var explosion = instance_create_layer(arg_constructable.x, arg_constructable.y, macro_logic_layer, obj_explosion);
arg_constructable.sprite_index = spr_rubble;