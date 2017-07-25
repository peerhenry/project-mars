var layer_name = "base";
var object = obj_wall;
var build_type = macro_basetile;

var t_layer = layer_get_id(layer_name);
var inst = instance_create_layer(x, y, t_layer, object);
with(inst)
{
	event_user(macro_event_finalize);
}
instance_destroy();