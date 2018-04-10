// Object for the soul purpose of testing the OOP framework
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;

enum TESTER
{
	// methods
	set_name,
	get_full_name,
	
	// test methods
	TEST_PARAMETERLESS_CONSTRUCTOR,
	TEST_CONSTRUCTOR_WITH_PARAMETERS,
	TEST_ALIAS
}

switch(method)
{
	#region CONSTRUCTOR
	case OBJECT.NEW:
		switch(argument_count) // constructor oveloading
		{
			case 2: // zero arguments
				call(this, TESTER.set_name, "John", "Smith");
				break;
			case 3:
				call(this, TESTER.set_name, argument[2], "Smith");
				break;
			case 4:
				call(this, TESTER.set_name, argument[2], argument[3]);
				break;
			default:
				show_error("Refused request: no constructor for argument count: " + string(argument_count), true);
		}
		return this;
	#endregion
		
	#region METHODS
	
	case TESTER.set_name:
		var this = argument[1];
		this.first_name = argument[2];
		this.last_name = argument[3];
		this.set_name = TESTER.set_name; // method alias
		this.get_full_name = TESTER.get_full_name; // method alias
		break;
	
	case TESTER.get_full_name:
		var this = argument[1];
		return this.first_name + " " + this.last_name;
		break;
	
	#endregion
	
	#region DESTRUCTOR
	
	case OBJECT.DESTROY:
		instance_destroy(this);
		break;
		
	#endregion
	
	#region UNIT TESTS
	
	case OBJECT.TEST:
		call_static(c_tester, TESTER.TEST_PARAMETERLESS_CONSTRUCTOR);
		call_static(c_tester, TESTER.TEST_CONSTRUCTOR_WITH_PARAMETERS);
		call_static(c_tester, TESTER.TEST_ALIAS);
		break;
	
	case TESTER.TEST_PARAMETERLESS_CONSTRUCTOR:
		test_init("TESTER.TEST_PARAMETERLESS_CONSTRUCTOR");
		// arrange
		var tester = new(c_tester);
		// act
		var result = call(tester, TESTER.get_full_name);
		// assert
		assert_equal("John Smith", result, "test object name");
		// cleanup
		destroy(tester);
		test_result();
		break;
	
	case TESTER.TEST_CONSTRUCTOR_WITH_PARAMETERS:
		test_init("TESTER.TEST_PARAMETERS_CONSTRUCTOR");
		// arrange
		var tester = new(c_tester, "Pietje", "Puk");
		// act
		var result = call(tester, TESTER.get_full_name);
		// assert
		assert_equal("Pietje Puk", result, "test object name");
		// cleanup
		destroy(tester);
		test_result();
		break;
	
	case TESTER.TEST_ALIAS:
		test_init("TESTER.TEST_ALIAS");
		// arrange
		var tester = new(c_tester);
		// act
		call(tester, "set_name", "Kermit", "the frog"); // call using alias
		var result = call(tester, "get_full_name");
		// assert
		assert_equal("Kermit the frog", result, "test object name");
		// cleanup
		destroy(tester);
		test_result();
		break;
		
	#endregion
	
	default:
		show_error("Refused request: function not defined", true);
}