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
	
	case get_class_info:
		return ok_class_info([
			prop_number("instance")	// doing number here instead of object because it can have any object_index
			, prop_string("method")
			, prop_array("arguments")
		]);
	
	// methods
	case "make_args":
		var value = args[0];
		var finalized_args = [];
		for(var n = scr_length(this.arguments) - 1; n >= 0; n--)
		{
			var next = this.arguments[n];
			if(instance_exists(next) && variable_instance_exists(next, "placemarker"))
			{
				destroy(next); // destroy placemarker
				finalized_args[n] = value;
			}
			else finalized_args[n] = next;
		}
		return ok(finalized_args);
	
	case "execute":
		if(scr_length(args) == 1)
		{
			var final_args = call_unwrap(this, "make_args", args[0]);
			return call(this.instance, this.method, final_args);
		}
		return call(this.instance, this.method, this.arguments);
	
	case "execute_destroy":
		call_unwrap(this.instance, this.method, this.arguments);
		destroy(this);
		return ok();
	
	case test:
		test_method(here, "test_execute_with_args");
		test_method(here, "test_execute_with_placemarker");
		break;
	
	case "test_execute_with_args":
		// arrange
		var stub_name = "dummy";
		var mocky = new(c_mock);
		var meth = prop_method(stub_name, t_void(), [
			p_integer("a"), p_integer("b"), p_string("c")
		]);
		call_unwrap(mocky, "add_prop", meth);
		var args = [1,2,"five"];
		var item = new(here, [mocky, stub_name, args]);
		// act
		void_unwrap(item, "execute");
		// assert
		mock_verify_args(mocky, stub_name, Times.Once, args);
		// cleanup
		destroy(mocky);
		destroy(item);
		destroy(meth);
		break;
	
	case "test_execute_with_placemarker":
		// arrange
		var stub_name = "dummy";
		var mocky = new(c_mock);
		var meth = prop_method(stub_name, t_void(), [
			p_integer("a"), p_integer("b"), p_integer("c")
		]);
		call_unwrap(mocky, "add_prop", meth);
		var args = [1, 2, new(c_arg_placemarker)];
		var item = new(here, [mocky, stub_name, args]);
		// act
		call_unwrap(item, "execute", 987);
		// assert
		mock_verify_args(mocky, stub_name, Times.Once, [1,2,987]);
		// cleanup
		destroy(mocky);
		destroy(item);
		destroy(meth);
		break;
	
	default:
		return refused();
}