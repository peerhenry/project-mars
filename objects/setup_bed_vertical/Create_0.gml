var layer_name = "base";
var object = obj_bed;
var build_type = macro_bed;
var current_rotation = global.build_rotation;
global.build_rotation = macro_rotation_0;
var t_layer = layer_get_id(layer_name);
var inst = instance_create_layer(x, y, t_layer, object);
scr_build_instance_finalize(inst, t_layer, build_type);
global.build_rotation = current_rotation;
instance_destroy();