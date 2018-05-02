/// @descr Mock class 
/*var method = argument0;
var this = argument1;
var args = argument2;
var here = c_mock_old;

switch(method)
{
	#region construct/destruct
	case constructor:
		this.interface = args[0];
		this.return_map = ds_map_create();
		this.call_count_map = ds_map_create();
		this.argument_map = ds_map_create();
		var stubs = scr_from_select(this.interface.methods, "name");
		var stub_count = array_length_1d(stubs);
		for(var n = 0; n < stub_count; n++)
		{
			var stub = stubs[n];
			this.call_count_map[? stub] = 0;
		}
		return this;
	
	case get_dependencies:
		// todo: make dependency on interface;
		return ok(skip_standards());
	
	case destructor:
		ds_map_destroy(this.return_map);
		ds_map_destroy(this.call_count_map);
		ds_map_destroy(this.argument_map);
		destroy(this.interface);
		return ok();
	
	case get_object_index:
		return ok(obj_empty);
	#endregion
	
	#region METHODS
	
	case "get_value":
		return ok(this);

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
	case "call_stub":
		var sig = args[0];
		var args = args[1];
		var stub = sig.name;
		// if stub has signature, assert arguments are of correct type
		if(!is_undefined(sig)) call_unwrap(sig, "assert_arguments", args);
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
		else return ok();
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
		test_method(here, "mock_test");
		break;
	
	case "mock_test":
		// arrange
		var intf = new_interface("whatever", [
			signature("foo", t_void(), t_string()),
			signature("bar", t_string(), t_number())
		]);
		var m = mock(intf);
		var expect = "BILLY";
		mock_setup_unwrapped(m, "bar", expect);
		// act
		call_unwrap(m, "foo", "dummy arg");
		call_unwrap(m, "foo", "whatever");
		var result = call_unwrap(m, "bar", 67);
		// assert
		mock_verify(m, "foo", Times.AtLeastOnce);
		mock_verify(m, "bar", Times.Once);
		assert_equal(expect, result, "result of calling bar");
		// cleanup
		destroy(m);
		assert_equal(0, scr_count_instances(obj_interface), "interface count");
		break;
	#endregion
	
	default:
		var sigs = this.interface.methods;
		for(var n = 0; n < array_length_1d(sigs); n++)
		{
			var sig = sigs[n];
			if(sig.name == method) return call(this, "call_stub", [sig, args]);
		}
		return refused();
}*/