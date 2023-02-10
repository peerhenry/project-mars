/// @arg class
function cs_get_parent_class(argument0) {
	var class = argument0;
	var result = script_execute(class, get_parent, noone, []); // WARNING: using call_static would cause an infinite loop
	if(result.refused_request)
	{
		instance_destroy(result);
		return c_object;
	}
	return unwrap(result);


}
