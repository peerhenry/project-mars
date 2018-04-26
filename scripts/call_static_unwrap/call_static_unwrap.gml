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
		if(result.refused_request){
			destroy(result);
			result = call_static(get_parent_class(script), method);
		}
		break;
	case 3:
		result = script_execute(script, method, argument[2]);
		// needs instance_exists(result) because it might be destructor
		if(instance_exists(result) && result.refused_request){
			destroy(result);
			result = call_static(get_parent_class(script), method, argument[2]);
		}
		break;
	case 4:
		result = script_execute(script, method, argument[2], argument[3]);
		if(result.refused_request){
			destroy(result);
			result = call_static(get_parent_class(script), method, argument[2], argument[3]);
		}
		break;
	case 5:
		result = script_execute(script, method, argument[2], argument[3], argument[4]);
		if(result.refused_request){
			destroy(result);
			result = call_static(get_parent_class(script), method, argument[2], argument[3], argument[4]);
		}
		break;
	case 6:
		result = script_execute(script, method, argument[2], argument[3], argument[4], argument[5]);
		if(result.refused_request)
		{
			destroy(result);
			result = call_static(get_parent_class(script), method, argument[2], argument[3], argument[4], argument[5]);
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

var value = script_execute(result.class, "unwrap", result);
destroy(result);
return value;