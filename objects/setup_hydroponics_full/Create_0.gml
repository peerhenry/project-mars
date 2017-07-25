var layer_name = "base";
var object = obj_hydroponics;
var build_type = macro_hydroponics;

var t_layer = layer_get_id(layer_name);
var inst = instance_create_layer(x, y, t_layer, object);
with(inst)
{
	event_user(macro_event_finalize);
}
inst.food_level = 100;
instance_destroy();