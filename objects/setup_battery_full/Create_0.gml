var layer_name = "base";
var object = obj_battery;
var build_type = macro_battery;

var t_layer = layer_get_id(layer_name);
var inst = instance_create_layer(x, y, t_layer, object);
scr_set_new_grid_props(inst, macro_grid_electric, macro_grid_storage_level, 1);
scr_build_instance_finalize(inst, t_layer, build_type);
instance_destroy();