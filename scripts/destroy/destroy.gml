var instance = argument[0];
var class = argument_count == 2 ? argument[1] : instance.class; // this is used for calling parent destructor

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
// ds_map_delete(global.class_instance_registry, instance);

// WARNING!
// Leave instance_destroy on result here
// Do not replace with destroy, that will cause an infinite loop