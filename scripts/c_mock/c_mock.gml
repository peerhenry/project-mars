/// @descr Mock class 
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_mock;

enum Times
{
	Never,
	AtLeastOnce,
	Once
}

switch(method)
{
	#region construct/destruct
	case constructor:
		this.signature_map = ds_map_create();
		this.call_count_map = ds_map_create();
		this.return_map = ds_map_create();
		this.argument_map = ds_map_create();
		if(scr_length(args) == 1)
		{
			var class_info = args[0];
			map_method(class_info.props, this, "add_prop");
		}
		return this;
	
	case "add_prop":
		var prop = args[0];
		if(prop.type_info.class == c_method_info)
		{
			this.call_count_map[? prop.name] = 0;
			this.signature_map[? prop.name] = prop.type_info;
		}
		else
		{
			var dummy = void_unwrap(prop.type_info, "create_dummy");
			variable_instance_set(this, prop.name, dummy);
		}
		return ok();
	
	case destructor:
		ds_map_destroy(this.signature_map);
		ds_map_destroy(this.return_map);
		ds_map_destroy(this.call_count_map);
		ds_map_destroy(this.argument_map);
		return ok();
	
	case get_object_index:
		return ok(obj_empty);
	#endregion
	
	#region METHODS

	#region setup_stub
	// Use setup to specify return values for stubs
	// The testing client is responsible for cleaning up any data structures it contains.
	case "setup_stub": // (method, return value) => result
		var stub = args[0];
		var return_result = args[1];
		if(return_result.object_index != obj_result) scr_panic("Cannot setup a method with an unwrapped result");
		this.return_map[? stub] = return_result;
		var existing = this.call_count_map[?stub];
		var exists = !is_undefined(existing);
		if(!exists) scr_panic("Cannot setup stub; Stub does not exist in mock: " + stub);
		return ok();
	
	case "setup_stub_unwrapped":
		var stub = args[0];
		var return_val = args[1];
		call_unwrap(this, "setup_stub", [stub, ok(return_val)]);
		return ok();
	
	#endregion
	
	#region call_stub
	case "get_method_info":
		var stub = args[0];
		var method_info = this.signature_map[?stub];
		if(is_undefined(method_info))
		{
			fail("c_mock.call_stub: method undefined: " + stub);
			return exception("no method info");
		}
		return ok(method_info);
	
	case "assert_argument_count":
		var method_info = args[0];
		var param_count = scr_length(method_info.parameters);
		var call_arg_count = args[1];
		var pass = assert_equal(param_count, call_arg_count, "c_mock.call_stub: argument count");
		if(!pass) return exception("fail");
		return ok();
	
	case "call_stub":
		var stub = args[0];
		var call_args = args[1];
		var method_info_result = call(this, "get_method_info", stub);
		var arg_count_action = new(c_action, [this, "assert_argument_count", 
			[new(c_arg_placemarker), scr_length(call_args)]
		]);
		var arg_count_result = call(method_info_result, "consume_action", arg_count_action);
		var type_check_action = new(c_action, [method_info, "assert_arguments", call_args]);
		var assert_result = call_unwrap(arg_count_result, "consume_action", type_check_action);
		// increment call count for method
		var count = this.call_count_map[?stub];
		this.call_count_map[?stub] = count + 1;
		this.argument_map[?stub] = args;
		// check if stub needs to return something
		var return_result = this.return_map[? stub];
		if(!is_undefined(return_result))
		{
			return return_result;
		}
		else
		{
			var method_info = call_unwrap(this, "get_method_info", stub);
			var dummy = void_unwrap(method_info.return_type_info, "create_dummy");
			return ok(dummy);
		}
	#endregion
	
	#region verify
	
	case "verify":
		var stub = args[0];
		var verification = args[1];
		var call_count = this.call_count_map[? stub]
		switch(verification)
		{
			case Times.Never:
				assert_equal(0, call_count, stub + " call_count");
				break;
			case Times.AtLeastOnce:
				assert_true(call_count > 0, stub + " called at least once");
				break;
			case Times.Once:
				assert_equal(1, call_count, stub + " call_count");
				break;
		}
		return ok();
		
	case "verify_last_call_arguments":
		var stub = args[0];
		var arguments = args[1];
		var last_arguments = this.argument_map[?stub];
		if(is_undefined(last_arguments)) fail("No arguments stored in mock for method: " + stub);
		else assert_arrays_are_equal(arguments, last_arguments);
		return ok();
	
	#endregion
	
	#endregion
	
	#region tests
	case test:
		test_method(here, "test_add_prop");
		test_method(here, "test_setup_stub");
		test_method(here, "test_call_stub");
		test_method(here, "test_verify");
		test_method(here, "test_verify_last_call_arguments");
		break;
	
	case "test_add_prop":
		// arrange
		var m = new(c_mock);
		// act
		call_unwrap(m, "add_prop", new(c_class_property, ["jim", t_number()]));
		// assert
		var dti = t_number();
		var d_number = void_unwrap(dti, "create_dummy");
		assert_equal(d_number, m.jim, "mock has prop");
		// cleanup
		destroy(dti);
		destroy(m);
		break;
	
	case "test_setup_stub":
		fail("nyi");
		break;
	
	case "test_call_stub":
		// arrange
		// act
		// assert
		// cleanup
		break;
	
	case "test_verify":
		// arrange
		// act
		// assert
		fail("nyi");
		// cleanup
		break;
		
	case "test_verify_last_call_arguments":
		// arrange
		// act
		// assert
		fail("nyi");
		// cleanup
		break;
	
	#endregion
	
	default:
		return call(this, "call_stub", [method, args]);
}