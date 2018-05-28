/// @descr Use this class to wrap an wrap and defer and instance method call
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_delay;

switch(method)
{
	case constructor: // can be remove if not needed
		this.action = args[0];
		this.delay = args[1];
		return this;

	case destructor:
		destroy(this.action);
		return ok();
	
	case get_object_index:
		return ok(obj_alarm_action);
	
	case get_class_info:
		return ok_class_info([
			owned_interface("action", [
				prop_method_void("execute", t_any())
			]),
			prop_number("delay")
		]);
	
	// methods
	case "set":
		with(this)
		{
			alarm[0] = 30*this.delay;
		}
		return ok();
	
	case test:
		break;
	
	default:
		return refused();
}