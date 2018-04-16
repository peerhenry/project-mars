/// @descr Mock class 
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_mock;

enum Times
{
	Never,
	AtLeastOnce,
	Once
}

switch(method)
{
	case constructor:
		var intf = argument[2];
		this.stubs = intf.methods;
		this.return_map = ds_map_create();
		this.call_count_map = ds_map_create();
		this.signatures = ds_map_create();
		var stub_count = array_length_1d(this.stubs);
		for(var n = 0; n < stub_count; n++)
		{
			var stub = this.stubs[n];
			this.call_count_map[?stub] = 0;
		}
		return this;

	// Use setup to specify return values for stubs
	// The testing client is responsible for cleaning up any data structures it contains.
	case "setup_stub": // (method, return value) => result
		var stub = argument[2];
		var return_result = argument[3];
		if(return_result.object_index != obj_result) scr_panic("Cannot setup a method with an unwrapped result");
		this.return_map[? stub] = return_result;
		var existing = this.call_count_map[?stub];
		var exists = !is_undefined(existing);
		if(!exists)
		{
			var apdx = array_length_1d(this.stubs);
			this.stubs[apdx] = stub;
			this.call_count_map[?stub] = 0;
		}
		return ok();
	
	case "setup_stub_unwrapped":
		var stub = argument[2];
		var return_val = argument[3];
		call_unwrap(this, "setup_stub", stub, ok(return_val));
		return ok();
	
	case "call_stub":
		var stub = argument[2];
		var args = argument[3];
		// if stub has signature, assert arguments are of correct type
		var sig = this.signatures[?stub]
		if(!is_undefined(sig)) call_unwrap(sig, "assert_arguments", args);
		// increment call count for method
		var count = this.call_count_map[?stub];
		this.call_count_map[?stub] = count + 1;
		// check if stub needs to return something
		var return_result = this.return_map[? stub];
		if(!is_undefined(return_result))
		{
			return return_result;
		}
		else return ok();
		
	case "verify":
		var stub = argument[2];
		var verification = argument[3];
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

	case destructor:
		ds_map_destroy(this.return_map);
		ds_map_destroy(this.call_count_map);
		ds_map_destroy(this.signatures);
		instance_destroy(this);
		break;
	
	case test:
		test_method(here, "mock_test");
		break;
	
	case "mock_test":
		// arrange
		var intf = interface([
			["foo", t_void(), t_string()],
			["bar", t_string(), t_number()]
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
		destroy(intf);
		break;
	
	default:
		#region put arguments in an array;
		var args = [];
		for(var n = 2; n < argument_count; n++)
		{
			var next_arg = argument[n];
			args[n-2] = next_arg;
		}
		#endregion
		for(var n = 0; n < array_length_1d(this.stubs); n++)
		{
			if(this.stubs[n] == method) return call(this, "call_stub", method, args);
		}
		return refused();
}