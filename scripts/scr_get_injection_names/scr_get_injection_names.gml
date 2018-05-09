/// @arg class
var class = argument0;
var info = void_static_unwrap(class, "get_class_info");
var injection_names = void_unwrap(info, "get_injection_names");
destroy(info);
return injection_names;