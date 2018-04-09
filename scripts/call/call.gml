/// @arg instance
/// @arg method
/// @arg arguments...
if(argument_count < 2) show_error("o_call must be supplied with at least an instance and a function name", true);
var instance = argument[0];
var method = argument[1];

if(!instance_exists(instance)) show_error("o_calll error: invalid instance", true);
if(!script_exists(instance.script)) show_error("o_calll error: instance has no script", true);

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
		show_error("o_calll error: Too many arguments", true);
}