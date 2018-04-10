/// @arg instance
/// @arg method
/// @arg arguments...
if(argument_count < 2) show_error("o_call must be supplied with at least an instance and a method", true);
var instance = argument[0];
var method = argument[1];

if(!instance_exists(instance)) show_error("call error: invalid instance", true);
if(!script_exists(instance.script)) show_error("call error: instance has no script", true);

// If the method is a string interpret it as an alias: the method id must exist as a variable in the instance
if(typeof(method) == "string")
{
	if(!variable_instance_exists(instance, method)) show_error("Refused request: function not defined", true);
	var method_id = variable_instance_get(instance, method);
	switch(argument_count)
	{
		case 2:
			return call(instance, method_id);
		case 3:
			return call(instance, method_id, argument[2]);
		case 4:
			return call(instance, method_id, argument[2], argument[3]);
		case 5:
			return call(instance, method_id, argument[2], argument[3], argument[4]);
		case 6:
			return call(instance, method_id, argument[2], argument[3], argument[4], argument[5]);
		case 7:
			return call(instance, method_id, argument[2], argument[3], argument[4], argument[5], argument[6]);
		case 8:
			return call(instance, method_id, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
		case 9:
			return call(instance, method_id, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
		default:
			show_error("call error: Too many arguments (argument_count: " + string(argument_count) + ")", true);
	}
}

switch(argument_count)
{
	case 2:
		return script_execute(instance.script, method, instance);
	case 3:
		return script_execute(instance.script, method, instance, argument[2]);
	case 4:
		return script_execute(instance.script, method, instance, argument[2], argument[3]);
	case 5:
		return script_execute(instance.script, method, instance, argument[2], argument[3], argument[4]);
	case 6:
		return script_execute(instance.script, method, instance, argument[2], argument[3], argument[4], argument[5]);
	case 7:
		return script_execute(instance.script, method, instance, argument[2], argument[3], argument[4], argument[5], argument[6]);
	case 8:
		return script_execute(instance.script, method, instance, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
	case 9:
		return script_execute(instance.script, method, instance, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
	default:
		show_error("call error: Too many arguments (argument_count: " + string(argument_count) + ")", true);
}