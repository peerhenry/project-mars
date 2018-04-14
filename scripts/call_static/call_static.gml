/// @arg script
/// @arg method
/// @arg arguments...
var script = argument[0];
var method = argument[1];

var result = noone;

switch(argument_count)
{
	case 2:
		result = script_execute(script, method);
		if(result.class == c_result && result.status == STATUS.REFUSED){
			destroy(result);
			result = call_static(get_parent(script), method);
		}
		break;
	case 3:
		result = script_execute(script, method, argument[2]);
		show_debug_message(method);
		show_debug_message(script_get_name(script));
		if(result.class == c_result && result.status == STATUS.REFUSED){
			destroy(result);
			result = call_static(get_parent(script), method, argument[2]);
		}
		break;
	case 4:
		result = script_execute(script, method, argument[2], argument[3]);
		if(result.class == c_result && result.status == STATUS.REFUSED){
			destroy(result);
			result = call_static(get_parent(script), method, argument[2], argument[3]);
		}
		break;
	case 5:
		result = script_execute(script, method, argument[2], argument[3], argument[4]);
		if(result.class == c_result && result.status == STATUS.REFUSED){
			destroy(result);
			result = call_static(get_parent(script), method, argument[2], argument[3], argument[4]);
		}
		break;
	case 6:
		result = script_execute(script, method, argument[2], argument[3], argument[4], argument[5]);
		if(result.class == c_result && result.status == STATUS.REFUSED)
		{
			destroy(result);
			result = call_static(get_parent(script), method, argument[2], argument[3], argument[4], argument[5]);
		}
		break;
	default:
		scr_panic("call_static error: Too many arguments");
}

if(
	method != constructor
	&& method != destructor
	&& method != test
	&& result.class != c_result
) scr_panic("Class method return type was not result: class: " + script_get_name(script) + " method: " + method);

return result;