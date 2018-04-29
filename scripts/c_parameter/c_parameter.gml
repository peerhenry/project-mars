var method = argument0;
var this = argument1;
var args = argument2;
var here = c_parameter;

switch(method)
{
	case constructor:
		this.name = args[0];
		this.type_info = args[1];
		return this;

	case get_dependencies:
		return ok(noone);	// return new(c_dependencies, []);

	case destructor: 
		return ok();
		
	case "get_interface":
		return [
			new(c_parameter, ["name", t_string()]),
			new(c_parameter, ["type_info", t_string()]),
		];
	
	// methods
	
	case test:
		test_method(here, "mytest");
		break;
	
	case "mytest":
		// arrange
		var tup = setup_testable(here);
		var testable = tup.item0;
		// act
		// assert
		fail("nyi");
		// cleanup
		cleanup_testable(tup);
		break;
	
	default:
		return refused();
}