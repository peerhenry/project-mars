/// @arg class
/// @arg instance
/// @arg args
function scr_apply_constructor(argument0, argument1, argument2) {
	var class = argument0;
	var instance = argument1;
	var args = argument2;
	var realthis = script_execute(class, constructor, instance, args);
	if(!instance_exists(realthis)) scr_panic("Constructor did not return an object.");
	if(realthis.class == c_result)
	{
		if(realthis.refused_request)
		{
			instance_destroy(realthis);
			var parent = cs_get_parent_class(class);
			return scr_apply_constructor(parent, instance, args)
		}
		return unwrap(realthis);
	}
	return realthis;


}
