var layer_name = "basetiles";
var object = obj_base_tile;
var build_type = macro_basetile;

var t_layer = layer_get_id(layer_name);
var inst = instance_create_layer(x, y, t_layer, object);
scr_build_instance_finalize(inst, t_layer, build_type);
instance_destroy();