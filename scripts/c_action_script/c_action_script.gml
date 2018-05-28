/// @descr Use this class to wrap an wrap and defer and instance method call
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_action_script;

switch(method)
{
	case constructor: // can be remove if not needed
		this.script = args[0];
		if(scr_length(args) == 2)
		{
			if(!is_array(args[1])) this.action_arguments = [args[1]];
			else this.action_arguments = args[1];
		}
		else this.action_arguments = [];
		return this;

	case destructor: 
		return ok();
	
	case get_class_info:
		return ok_class_info([
			prop_script("script")	// doing number here instead of object because it can have any object_index
			, prop_array("action_arguments")
		]);
	
	// methods
	case "execute":
		var action_arguments = this.action_arguments;
		switch(scr_length(action_arguments))
		{
			case 0:
				var res = script_execute(action_arguments);
				break;
			case 1:
				var res = script_execute(this.script, action_arguments[0]);
				break;
			case 2:
				var res = script_execute(this.script, action_arguments[0], action_arguments[1]);
				break;
			case 3:
				var res = script_execute(this.script, action_arguments[0], action_arguments[1], action_arguments[2]);
				break;
		}
		return ok(res);
	
	case "execute_destroy":
		void_unwrap(this, "execute");
		destroy(this);
		return ok();
	
	case test:
		break;
	
	default:
		return refused();
}