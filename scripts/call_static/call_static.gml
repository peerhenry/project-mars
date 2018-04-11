/// @arg script
/// @arg method
/// @arg arguments...
var script = argument[0];
var method = argument[1];

switch(argument_count)
{
	case 2:
		return script_execute(script, method);
	case 3:
		return script_execute(script, method, argument[2]);
	case 4:
		return script_execute(script, method, argument[2], argument[3]);
	case 5:
		return script_execute(script, method, argument[2], argument[3], argument[4]);
	case 6:
		return script_execute(script, method, argument[2], argument[3], argument[4], argument[5]);
	case 7:
		return script_execute(script, method, argument[2], argument[3], argument[4], argument[5], argument[6]);
	case 8:
		return script_execute(script, method, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
	case 9:
		return script_execute(script, method, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
	default:
		show_error("call_static error: Too many arguments", true);
}