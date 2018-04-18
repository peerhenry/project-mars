var instance = argument[0];
var class = argument_count == 2 ? argument[1] : instance.class;
var result = script_execute(class, destructor, instance);
if(instance_exists(result)) // if a result is returned, it means refused request, so try parent
{
	destroy(result);
	var parent = get_parent(class);
	if(!is_undefined(parent)) result = destroy(instance, parent);
}
if(instance_exists(result)) scr_panic("Destroying " + script_get_name(instance.class) + " does not work!");