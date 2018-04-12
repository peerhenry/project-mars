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
				call(this, "set_name", "John", "Smith");
				break;
			case 3:
				call(this, "set_name", argument[2], "Smith");
				break;
			case 4:
				call(this, "set_name", argument[2], argument[3]);
				break;
			default:
				show_error("Refused request: no constructor for argument count: " + string(argument_count), true);
		}
		return this;
	
	#endregion
		
	#region METHODS
	
	case "set_name":
		var this = argument[1];
		this.first_name = argument[2];
		this.last_name = argument[3];
		break;
	
	case "get_full_name":
		var this = argument[1];
		return this.first_name + " " + this.last_name;
	
	#endregion
	
	#region DESTRUCTOR
	
	case destructor:
		instance_destroy(this);
		break;
		
	#endregion
	
	#region UNIT TESTS
	
	case test:
		call_static(c_tester, "test_parameterless_constructor");
		call_static(c_tester,  "test_constructor_with_parameters");
		break;
	
	case "test_parameterless_constructor":
		test_init(script_get_name(c_tester) + "test_parameterless_constructor");
		// arrange
		var tester = new(c_tester);
		// act
		var result = call(tester, "get_full_name");
		// assert
		assert_equal("John Smith", result, "test object name");
		// cleanup
		destroy(tester);
		test_result();
		break;
	
	case "test_constructor_with_parameters":
		test_init(script_get_name(c_tester) + ".test_constructor_with_parameters");
		// arrange
		var tester = new(c_tester, "Pietje", "Puk");
		// act
		var result = call(tester, "get_full_name");
		// assert
		assert_equal("Pietje Puk", result, "test object name");
		// cleanup
		destroy(tester);
		test_result();
		break;
		
	#endregion
	
	default:
		show_error("Refused request: function not defined", true);
}