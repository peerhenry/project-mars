/// @description Insert description here
// You can write your code in this editor
var inst = instance_create_layer(x, y, macro_base_tile_layer, obj_cable);
with(inst)
{
	event_user(macro_event_finalize);
}
instance_destroy();