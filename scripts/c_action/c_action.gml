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
		if(scr_length(args) == 3) this.args = args[2];
		else this.args = [];
		return this;

	case destructor: 
		return ok();
	
	case get_dependencies:
		return ok_deps([
			new_interface("instance", []),
			dependency("method", t_string())
		]);
	
	// methods
	case "execute":
		return call(this.instance, this.method, this.args);
	
	case "execute_destroy":
		call_unwrap(this.instance, this.method, this.args);
		destroy(this);
		return ok();
	
	case test:
		test_method(here, "test_execute_with_args");
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