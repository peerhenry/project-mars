var layer_name = "base";
var object = obj_suit_closet;
var build_type = macro_suit_closet_empty;

var t_layer = layer_get_id(layer_name);
var inst = instance_create_layer(x, y, t_layer, object);
with(inst)
{
	holds_suit = false;
	image_index += 4;
}
scr_build_instance_finalize(inst, t_layer, build_type);
instance_destroy();