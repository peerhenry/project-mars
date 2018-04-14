/// @arg instance
/// @arg method
/// @arg arguments...
if(argument_count < 2) show_error("call must be supplied with at least an instance and a method", true);
var instance = argument[0];
var method = argument[1];

var result = noone;

switch(argument_count)
{
	case 2:
		result = call(instance, method);
		break;
	case 3:
		result = call(instance, method, argument[2]);
		break;
	case 4:
		result = call(instance, method, argument[2], argument[3]);
		break;
	case 5:
		result = call(instance, method, argument[2], argument[3], argument[4]);
		break;
	case 6:
		result = call(instance, method, argument[2], argument[3], argument[4], argument[5]);
		break;
	default:
		scr_panic("call error: Too many arguments (argument_count: " + string(argument_count) + ")");
}
var value = script_execute(result.class, "unwrap", result);
destroy(result);
return value;