/// @arg name
function prop_number() {
	var name = argument[0];
	var handle = argument_count == 2 ? argument[1] : 0;
	return scr_create_prop(name, t_number(), handle);


}
