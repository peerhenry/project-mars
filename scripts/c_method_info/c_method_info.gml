var method = argument0;
var this = argument1;
var args = argument2;
var here = c_method_info;

switch(method)
{
	#region constructor
	
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
				if(!is_array(arg_info))
				{
					arg_info = [arg_info];
				}
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

	#endregion constructor
	
	#region methods
	
	case "create_dummy":
		// hmm, does this have any purpose here??
		return ok();
	
	case "assert_match":
		var other_meth_info = args[0];
		call_unwrap(this.return_type_info, "assert_match", other_meth_info.return_type_info);
		var pass = assert_equal(scr_length(this.parameters),  scr_length(other_meth_info.parameters), "c_method_info assert_match: parameter count");
		if(!pass) return ok(); // not gonna try to match arguments if their lengths don't match
		for(var n = 0; n < scr_length(this.parameters); n++)
		{
			var next_param = this.parameters[n];
			var other_param = other_meth_info.parameters[n];
			assert_equal(next_param.name, other_param.name, "parameter name");
			call_unwrap(next_param.type_info, "assert_match", other_param.type_info);
		}
		return ok();
		
	case "private_param_to_dummy":
		var param = args[0];
		var dummy = void_unwrap(param.type_info, "create_dummy");
		return ok(dummy);
	
	case "assert_type": // given an instance and a method, does it respond to giver arguments - and does it return a proper type
		var instance = args[0];
		var method = args[1];
		var dummy_args = map_method(this.parameters, this, "private_param_to_dummy");
		var returned = call_unwrap(instance, method, dummy_args);
		call_unwrap(this.return_type_info, "assert_type", returned);
		return ok();
	
	#endregion
	
	#region tests
	
	case test:
		test_method(here, "test_construct");
		test_method(here, "test_construct_parameters");
		test_method(here, "test_assert_match");
		test_method(here, "test_private_param_to_dummy");
		test_method(here, "test_assert_type");
		break;
	
	case "test_construct":
		// setup
		var thing = new(c_method_info, [t_void(), p_string("d1")]);
		// assert
		assert_equal(0, scr_length(thing.parameters), "parameters length");
		assert_equal(TYPE.STRING, thing.return_type_info.type, "return_type_info");
		// cleanup
		destroy(thing);
		break;
	
	case "test_construct_parameters":
		// setup
		var thing = new(c_method_info, [
			t_void(), 
			[p_number("d1"), p_string("d2"), p_object("d3", obj_empty)]
		]);
		// assert
		assert_equal(3, scr_length(thing.parameters), "parameters length");
		assert_equal(TYPE.VOID, thing.return_type_info.type, "return_type_info");
		// cleanup
		destroy(thing);
		break;
	
	case "test_assert_match":
		// setup
		var substrate = new(c_method_info, [
			t_void(), 
			[p_number("d1"), p_string("d2"), p_object("d3", obj_empty)]
		]);
		var thing = new(c_method_info, [
			t_void(), 
			[p_number("d1"), p_string("d2"), p_object("d3", obj_empty)]
		]);
		// assert
		call_unwrap(substrate, "assert_match", thing);
		// cleanup
		destroy(substrate);
		destroy(thing);
		break;
	
	case "test_private_param_to_dummy":
		// setup
		var param = new(c_parameter, ["sam", t_object(obj_empty)]);
		// act
		var thing = call_static_unwrap(here, "private_param_to_dummy", param);
		// assert
		assert_true(instance_exists(thing), "thing is an object");
		call_unwrap(param.type_info, "assert_type", thing);
		// cleanup
		destroy(param);
		instance_destroy(thing);
		break;
	
	case "test_assert_type":
		var meth_info = new(c_method_info, [
			t_void(), 
			[p_number("d1"), p_string("d2"), p_object("d3", obj_empty)]
		]);
		var mocky = new(c_mock);
		call_unwrap(mocky, "add_prop", new(c_class_property, ["foo", meth_info]));
		// assert
		// call_unwrap(meth_info, "assert_type", [mocky, "foo"]);
		fail("temp disabled; need to finish c_mock first");
		// cleanup
		destroy(mocky);
		destroy(meth_info);
		break;
	
	#endregion
	
	default:
		return refused();
}