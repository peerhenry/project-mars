/// @arg name
/// @arg object_index
function borrowed_object(argument0) {
	var name = argument0;
	var thing = fnew(c_class_property, [name, t_object(argument1)]);
	thing.is_borrowed = true;
	return thing;


}
