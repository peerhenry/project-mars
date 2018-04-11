/// @arg container
/// @arg script_name
/// @arg arguments...
var script = resolve(argument[0], argument[1]);
switch(argument_count)
{
	case 2:
		return script_execute(script);
	case 3:
		return script_execute(script, argument[2]);
	case 4:
		return script_execute(script, argument[2], argument[3]);
	case 5:
		return script_execute(script, argument[2], argument[3], argument[4]);
	case 6:
		return script_execute(script, argument[2], argument[3], argument[4], argument[5]);
	case 7:
		return script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6]);
	case 8:
		return script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
	case 9:
		return script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
	case 10:
		return script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]);
	case 11:
		return script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10]);
	case 12:
		return script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11]);
	case 13:
		return script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12]);
	default:
		show_error("Too many arguments in resolve_execute: " + string(argument_count), true);
}