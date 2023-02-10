/// @arg name
/// @arg object_index
function owned_object(argument0) {
	var name = argument0;
	var thing = fnew(c_class_property, [name, t_object(argument1)]);
	thing.is_borrowed = false;
	return thing;


}
