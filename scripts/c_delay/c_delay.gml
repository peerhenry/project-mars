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
		return ok();
	
	case get_object_index:
		return obj_alarm_action;
	
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