var method = argument0;
var this = argument1;
var args = argument2;
var here = c_method;

switch(method)
{
	case constructor: // can be remove if not needed
		this.arg_info_array = [];
		this.type = TYPE.METHOD;
		var count = scr_length(args);
		if(count > 0)
		{
			this.return_type_info = args[0];
			if(count > 1)
			{
				var arg_info = args[1];
				if(!is_array(arg_info)) arg_info = [arg_info];
				this.arg_info_array = arg_info;
			}
		}
		else this.return_type_info = t_void();
		return this;

	case get_interface:
		return new(c_interface, [
			new(c_interface_property, ["return_type_info", t_object(obj_type_info)]),
			new(c_interface_property, ["arg_info_array", t_array()])
		]);
		break;

	case destructor:
		destroy(this.return_type_info);
		map_script(this.arg_info_array, destroy);
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
		// arrange
		var tup = setup_testable(here);
		var testable = tup.item0;
		// act
		// assert
		// cleanup
		cleanup_testable(tup);
		break;
	
	default:
		return refused();
}