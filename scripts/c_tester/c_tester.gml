function c_tester(argument0, argument1, argument2) {
	// Object for the soul purpose of testing the OOP framework
	var func = argument0;
	var this = argument1;
	var args = argument2;

	switch(func)
	{
	#region CONSTRUCTOR
	
		case constructor:
			var args_count = array_length_1d(args);
			switch(array_length_1d(args)) // constructor oveloading
			{
				case 0: // zero arguments
					call_unwrap(this, "set_name", ["John", "Smith"]);
					break;
				case 1:
					call_unwrap(this, "set_name", [args[0], "Smith"]);
					break;
				case 2:
					call_unwrap(this, "set_name", args);
					break;
				default:
					scr_panic("Refused request: no constructor for argument count: " + string(args_count));
			}
			return this;
	
	#endregion
		
	#region METHODS
	
		case "set_name":
			this.first_name = args[0];
			this.last_name = args[1];
			return ok();
	
		case "get_full_name":
			var val = this.first_name + " " + this.last_name;
			return ok(val);
	
	#endregion
	
	#region UNIT TESTS
	
		case test:
			test_method(c_tester, "test_new_leaves_no_trailing_results");
			test_method(c_tester, "test_parameterless_constructor");
			test_method(c_tester,  "test_constructor_with_parameters");
			break;
	
		case "test_new_leaves_no_trailing_results":
			// arrange
			// act
			var tester = fnew(c_tester);
			// assert
			assert_object_count(0, obj_result);
			// cleanup
			destroy(tester);
			break;
	
		case "test_parameterless_constructor":
			// arrange
			var tester = fnew(c_tester);
			// act
			var result = void_unwrap(tester, "get_full_name");
			// assert
			assert_equal("John Smith", result, "test object name");
			// cleanup
			destroy(tester);
			break;
	
		case "test_constructor_with_parameters":
			// arrange
			var tester = fnew(c_tester, ["Pietje", "Puk"]);
			// act
			var result = void_unwrap(tester, "get_full_name");
			// assert
			assert_equal("Pietje Puk", result, "test object name");
			// cleanup
			destroy(tester);
			break;
		
	#endregion
	
		default:
			return refused();
	}


}
