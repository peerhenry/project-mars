/// @arg name
/// @arg object_index
var name = argument[0];
var handle = argument_count == 3 ? argument[2] : 0;
return scr_create_prop(name, t_object(argument[1]), handle);