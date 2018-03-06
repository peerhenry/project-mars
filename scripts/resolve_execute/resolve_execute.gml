/// @arg container
/// @arg script_name
/// @arg arguments...
var script = resolve(argument[0], argument[1]);
switch(argument_count)
{
	case 2:
		script_execute(script);
		break;
	case 3:
		script_execute(script, argument[2]);
		break;
	case 4:
		script_execute(script, argument[2], argument[3]);
		break;
	case 5:
		script_execute(script, argument[2], argument[3], argument[4]);
		break;
	case 6:
		script_execute(script, argument[2], argument[3], argument[4], argument[5]);
		break;
	case 7:
		script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6]);
		break;
	case 8:
		script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
		break;
	case 9:
		script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
		break;
	case 10:
		script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]);
		break;
	case 11:
		script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10]);
		break;
	case 12:
		script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11]);
		break;
	case 13:
		script_execute(script, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12]);
		break;
}