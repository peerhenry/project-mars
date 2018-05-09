/// @arg name
/// @arg interface_props_array
/// @arg (optional)owned_and_or_not_injected
var handle = argument_count == 3 ? argument[2] : 0;
return scr_create_prop(argument[0], t_interface(argument[1]), handle);