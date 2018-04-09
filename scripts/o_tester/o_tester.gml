// Object for the soul purpose of testing the OOP framework
var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;

enum TESTER
{
	set_name,
	get_full_name,
	
	TEST_PARAMETERLESS_CONSTRUCTOR,
	TEST_CONSTRUCTOR_WITH_PARAMETERS
}

switch(method)
{
	#region constructor
	case OBJECT.NEW:
		switch(argument_count)
		{
			case 2:
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
		
	// METHODS
	case TESTER.set_name:
		var this = argument[1];
		this.first_name = argument[2];
		this.last_name = argument[3];
		break;
	
	case TESTER.get_full_name:
		var this = argument[1];
		return this.first_name + " " + this.last_name;
		break;
	
	// DESTRUCTOR
	case OBJECT.DESTROY:
		instance_destroy(this);
		break;
	
	// TEST METHODS
	#region unit tests
	
	case OBJECT.TEST:
		call_static(o_tester, TESTER.TEST_PARAMETERLESS_CONSTRUCTOR);
		call_static(o_tester, TESTER.TEST_CONSTRUCTOR_WITH_PARAMETERS);
		break;
	
	case TESTER.TEST_PARAMETERLESS_CONSTRUCTOR:
		test_init("TESTER.TEST_PARAMETERLESS_CONSTRUCTOR");
		// arrange
		var tester = new(o_tester);
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
		var tester = new(o_tester, "Pietje", "Puk");
		// act
		var result = call(tester, TESTER.get_full_name);
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