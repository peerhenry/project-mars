/// @arg name
/// @arg object_index
var name = argument0;
var thing = new(c_class_property, [name, t_object(argument1)]);
thing.is_borrowed = true;
return thing;