/// @arg script
/// @arg method
var script = argument0;
var method = argument1;
return script_execute(script, method);

switch(argument_count)
{
	case 2:
		return script_execute(script, method);
	case 3:
		return script_execute(script, method, argument[1]);
	case 4:
		return script_execute(script, method, argument[1], argument[2]);
	case 5:
		return script_execute(script, method, argument[1], argument[2], argument[3]);
	case 6:
		return script_execute(script, method, argument[1], argument[2], argument[3], argument[4]);
	case 7:
		return script_execute(script, method, argument[1], argument[2], argument[3], argument[4], argument[5]);
	case 8:
		return script_execute(script, method, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]);
	case 9:
		return script_execute(script, method, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
	case 10:
		return script_execute(script, method, argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
	default:
		show_error("o_calll error: Too many arguments", true);
}