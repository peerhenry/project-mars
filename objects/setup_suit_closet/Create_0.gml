var layer_name = "base";
var object = obj_suit_closet;
var build_type = macro_suit_closet;

var t_layer = layer_get_id(layer_name);
var inst = instance_create_layer(x, y, t_layer, object);
with(inst)
{
	//event_user(macro_event_finalize);
}
instance_destroy();