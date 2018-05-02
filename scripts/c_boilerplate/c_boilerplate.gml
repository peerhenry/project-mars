var method = argument0;
var this = argument1;
var args = argument2;
var here = c_boilerplate; // <=== CHANGE THIS

switch(method)
{
	case constructor: // can be remove if not needed
		return this;

	case destructor: 
		return ok();

	case get_class_info:
		return ok_class_info([]);
	
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