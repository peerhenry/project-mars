/// @arg name
/// @arg type
var name = argument0;
var named_interface = argument1;
var name = named_interface.name;
var methods = named_interface.value;
destroy(named_interface); // destroy wrapper
var interface = new_interface(methods);
return new(c_dependency, name, t_script(), false, interface);