/// @arg instance
/// @arg method
/// @arg arguments...
if(argument_count < 2) scr_panic("call must be supplied with at least an instance and a method");
var instance = argument[0];
var method = argument[1];
var result = noone;
var parent_class = get_parent(instance.class);
switch(argument_count)
{
	case 2:
		result = call_static(parent_class, method, instance);
		break;
	case 3:
		result = call_static(parent_class, method, instance, argument[2]);
		break;
	case 4:
		result = call_static(parent_class, method, instance, argument[2], argument[3]);
		break;
	case 5:
		result = call_static(parent_class, method, instance, argument[2], argument[3], argument[4]);
		break;
	case 6:
		result = call_static(parent_class, method, instance, argument[2], argument[3], argument[4], argument[5]);
		break;
	default:
		scr_panic("call error: Too many arguments (argument_count: " + string(argument_count) + ")");
}

if(result.class != c_result) scr_panic("Class method return type was not result: class: " + script_get_name(parent_class) + " method: " + method);
return result;