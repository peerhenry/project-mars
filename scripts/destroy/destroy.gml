var instance = argument[0];
var class = argument_count == 2 ? argument[1] : instance.class; // this is used for calling parent destructor

#region trace call
var trace_it = debug_mode && class != c_result;
if(trace_it)
{
	show_debug_message("[DESTROY] " + script_get_name(class));
}
#endregion trace call

var result = scr_call_destructor(class, instance);
while(result.refused_request && class != c_object)
{
	instance_destroy(result);
	class = cs_get_parent_class(class);
	result = scr_call_destructor(class, instance);
}
if(result.refused_request) scr_panic("Destroying " + script_get_name(instance.class) + " does not work!");
instance_destroy(result);
instance_destroy(instance);

// WARNING!
// Leave instance_destroy on result here
// Do not replace with destroy, that will cause an infinite loop