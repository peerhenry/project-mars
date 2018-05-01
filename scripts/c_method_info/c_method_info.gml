var method = argument0;
var this = argument1;
var args = argument2;
var here = c_method_info;

switch(method)
{
	case constructor: // can be remove if not needed
		this.parameters = [];
		this.type = TYPE.METHOD;
		var count = scr_length(args);
		if(count > 0)
		{
			this.return_type_info = args[0];
			if(count > 1)
			{
				var arg_info = args[1];
				if(!is_array(arg_info)) arg_info = [arg_info];
				this.parameters = arg_info;
			}
		}
		else this.return_type_info = t_void();
		return this;

	case get_interface:
		return new(c_interface, [
			new(c_interface_property, ["return_type_info", t_object(obj_type_info)]),
			new(c_interface_property, ["parameters", t_array()])
		]);
		break;

	case destructor:
		destroy(this.return_type_info);
		map_script(this.parameters, destroy);
		return ok();
	
	// methods
	case "get_dummy_value":
		// hmm, does this have any purpose here??
		return ok();
	
	case "assert_match":
		return ok();
	
	case "assert_type": // given an instance and a method, does it respond to giver arguments - and does it return a proper type
		return ok();
	
	case test:
		test_method(here, "mytest");
		break;
	
	case "mytest":
		fail("nyi");
		break;
	
	default:
		return refused();
}