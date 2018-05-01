/// @descr Use this class to wrap an wrap and defer and instance method call
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_action;

switch(method)
{
	case constructor: // can be remove if not needed
		this.instance = args[0];
		this.method = args[1];
		if(scr_length(args) == 3) this.arguments = args[2];
		else this.arguments = [];
		return this;

	case destructor: 
		return ok();
	
	case get_dependencies:
		return ok_deps([
			new_interface("instance", []),
			dependency("method", t_string())
		]);
	
	// methods
	case "make_args":
		var value = args[0];
		var finalized_args = [];
		for(var n = scr_length(this.arguments); n >= 0; n--)
		{
			var next = this.arguments[n];
			if(instance_exists(next) && variable_instance_exists(next, "placeholder")) finalized_args[n] = value;
			else finalized_args[n] = next;
		}
		return finalized_args;
	
	case "execute":
		if(scr_length(args) == 1)
		{
			var final_args = call_unwrap(this, "make_args", args[0]);
			return call(this.instance, this.method, final_args);
		}
		// var arguments = call_unwrap(this, "make_args", this.args);
		return call(this.instance, this.method, this.arguments);
	
	case "execute_destroy":
		call_unwrap(this.instance, this.method, this.arguments);
		destroy(this);
		return ok();
	
	case test:
		test_method(here, "test_execute_with_args");
		// todo: test with argument placemarkers
		break;
	
	case "test_execute_with_args":
		// arrange
		var stub_name = "dummy";
		var mocky = mock(new_interface("instance", [
			signature(stub_name, t_void(), [ t_integer(), t_integer(), t_string() ])
		]));
		var args = [1,2,"five"];
		var item = new(here, [mocky, stub_name, args]);
		// act
		void_unwrap(item, "execute");
		// assert
		mock_verify_args(mocky, stub_name, Times.Once, args);
		// cleanup
		destroy(mocky);
		destroy(item);
		break;
	
	default:
		return refused();
}