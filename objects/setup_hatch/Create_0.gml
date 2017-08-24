var layer_name = "base";
var object = obj_hatch;
var build_type = macro_hatch;

//scr_remove_if_present(x, y, obj_wall);
var wall_instance = instance_position(x, y, obj_wall);
instance_destroy(wall_instance);

var t_layer = layer_get_id(layer_name);
var inst = instance_create_layer(x, y, t_layer, object);
with(inst)
{
	//event_user(macro_event_finalize);
}
instance_destroy();