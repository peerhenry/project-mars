// Object for the soul purpose of testing the OOP framework
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;

switch(method)
{
	#region CONSTRUCTOR
	
	case constructor:
		switch(argument_count) // constructor oveloading
		{
			case 2: // zero arguments
				call_unwrap(this, "set_name", "John", "Smith");
				break;
			case 3:
				call_unwrap(this, "set_name", argument[2], "Smith");
				break;
			case 4:
				call_unwrap(this, "set_name", argument[2], argument[3]);
				break;
			default:
				scr_panic("Refused request: no constructor for argument count: " + string(argument_count));
		}
		return this;
	
	#endregion
		
	#region METHODS
	
	case "set_name":
		this.first_name = argument[2];
		this.last_name = argument[3];
		return ok();
	
	case "get_full_name":
		var this = argument[1];
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
		var tester = new(c_tester);
		// assert
		assert_object_count(0, obj_result);
		// cleanup
		destroy(tester);
		break;
	
	case "test_parameterless_constructor":
		// arrange
		var tester = new(c_tester);
		// act
		var result = call_unwrap(tester, "get_full_name");
		// assert
		assert_equal("John Smith", result, "test object name");
		// cleanup
		destroy(tester);
		break;
	
	case "test_constructor_with_parameters":
		// arrange
		var tester = new(c_tester, "Pietje", "Puk");
		// act
		var result = call_unwrap(tester, "get_full_name");
		// assert
		assert_equal("Pietje Puk", result, "test object name");
		// cleanup
		destroy(tester);
		break;
		
	#endregion
	
	default:
		return refused();
}