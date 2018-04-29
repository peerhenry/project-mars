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
			if(!is_array(args[1])) this.args = [args[1]];
			else this.args = args[1];
		}
		else this.args = [];
		return this;

	case destructor: 
		return ok();
	
	case get_dependencies:
		return ok_deps([
			dependency("script", t_script()),
			dependency("args", t_array())
		]);
	
	// methods
	case "execute":
		switch(scr_length(this.args))
		{
			case 0:
				var res = script_execute(this.script);
				break;
			case 1:
				var res = script_execute(this.script, this.args[0]);
				break;
			case 2:
				var res = script_execute(this.script, this.args[0], this.args[1]);
				break;
			case 3:
				var res = script_execute(this.script, this.args[0], this.args[1], this.args[2]);
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