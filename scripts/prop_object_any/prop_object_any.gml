/// @arg name
/// @arg object_index
function prop_object_any() {
	var name = argument[0];
	var handle = argument_count == 3 ? argument[2] : 0;
	return scr_create_prop(name, t_object_any(), handle);


}
