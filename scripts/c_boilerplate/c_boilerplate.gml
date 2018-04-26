var method = argument0;
var this = argument1;
var args = argument2;
var here = c_boilerplate; // <=== CHANGE THIS

switch(method)
{
	case constructor: // can be remove if not needed
		return this;

	case get_dependencies:
		return ok(noone);	// return new(c_dependencies, []);

	case destructor: 
		return ok();
	
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
		// cleanup
		cleanup_testable(tup);
		break;
	
	default:
		return refused();
}