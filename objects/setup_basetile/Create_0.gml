var layer_name = "basetiles";
var object = obj_base_tile;

var t_layer = layer_get_id(layer_name);
var new_inst = instance_create_layer(x, y, t_layer, object);
with(new_inst)
{
	//event_user(macro_event_finalize);
}
instance_destroy();