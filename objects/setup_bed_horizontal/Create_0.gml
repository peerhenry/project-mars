var layer_name = "base";
var object = obj_bed;
var build_type = macro_bed;
var current_rotation = global.construction_ghost[? macro_ghost_rotation];
global.construction_ghost[? macro_ghost_rotation] = macro_rotation_1;
var t_layer = layer_get_id(layer_name);
var inst = instance_create_layer(x, y, t_layer, object);
with(inst)
{
	//event_user(macro_event_finalize);
}
global.construction_ghost[? macro_ghost_rotation] = current_rotation;
instance_destroy();