var layer_name = "base_tall";
var object = obj_oxygen_tank;
var build_type = macro_oxygen_tank;

var t_layer = layer_get_id(layer_name);
var inst = instance_create_layer(x, y, t_layer, object);
scr_set_new_grid_props(inst, macro_grid_oxygen, macro_grid_storage_level, 1);
with(inst)
{
	//event_user(macro_event_finalize);
}
instance_destroy();