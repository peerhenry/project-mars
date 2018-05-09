/// @arg class
var class = argument0;

var info = void_static_unwrap(class, get_class_info);
var inj_props = uvoid(info, "get_injected_props");
var dummy_values = scr_from_select_morph(inj_props, "type_info", "create_dummy");
var instance = new(class, dummy_values);
destroy(info);
return instance;