var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_signature;

switch(method)
{
	#region con/des
	
	case constructor:
		this.name = argument[2];
		this.return_type = argument[3];
		var argument_types = argument[4];	// array of types
		if(!is_array(argument_types)) argument_types = [argument_types];
		this.argument_types = argument_types;
		return this;

	// destroys all types
	case destructor:
		for(var n = 0; n < array_length_1d(this.argument_types); n++)
		{
			var next_type = this.argument_types[n];
			destroy(next_type);
		}
		destroy(this.return_type);
		instance_destroy(this);
		break;
	
	#endregion

	#region assert_arguments
	// assert if arguments comply with types in signature
	case "assert_arguments":
		var arguments = argument[2];
		for(var n = 0; n < array_length_1d(arguments); n++)
		{
			var arg = arguments[n];
			var exp_type = this.argument_types[n];
			// show_debug_message("Checking type for: " + string(arg)); // DEBUG
			// show_debug_message("exp_type.type: " + string(exp_type.type)); // DEBUG
			call_unwrap(exp_type, "assert_type", arg);
		}
		return ok();
	#endregion assert_arguments
	
	#region get_dummy_arguments
	// Gets dummy arguments for signature
	case "get_dummy_arguments":
		var array = [];
		for(var n = 0; n < array_length_1d(this.argument_types); n++)
		{
			var next_type = this.argument_types[n]
			var dummy = call_unwrap(next_type, "create_dummy");
			array[n] = dummy;
		}
		return ok(array);
	#endregion


	
	#region TESTS
	case test:
		test_method(here, "test_constructor");
		test_method(here, "test_assert_arguments");
		break;
	
	case "test_constructor":
		// arrange
		// act
		var sig = signature("foo", t_string(), [t_number(), t_string()]);
		// assert
		var at1 = sig.argument_types[0];
		var at2 = sig.argument_types[1];
		assert_equal(TYPE.STRING, sig.return_type.type, "return type");
		assert_equal(TYPE.NUMBER, at1.type, "argument_types[0]");
		assert_equal(TYPE.STRING, at2.type, "argument_types[1]");
		// cleanup
		destroy(sig);
		break;
	
	case "test_assert_arguments":
		// arrange
		var astro = instance_create_depth(0,0,0,obj_astronaut);
		// act
		var sig = signature("foo", t_void(), [t_string(), t_number(), t_object(obj_astronaut)]);
		// assert
		call_unwrap(sig, "assert_arguments", ["dummy", 25, astro]);
		// cleanup
		instance_destroy(astro);
		destroy(sig);
		break;
	#endregion TESTS
	
	default:
		scr_panic("Refused request: function not defined");
}