function c_boilerplate(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;
	var here = c_boilerplate; // <=== CHANGE THIS

	switch(func)
	{
		case constructor: // can be remove if not needed
			return this;

		case destructor: 
			return ok();

		case get_class_info:
			return ok_class_info([]);
	
		// array of tuples containing class and dependency name
		case get_clients:
			return ok(noone);
	
		// methods
	
		case test:
			test_method(here, "mytest");
			break;
	
		case "mytest":
			// arrange
			var testable = setup_testable(here);
			// act
			// assert
			// cleanup
			cleanup_testable(testable);
			break;
	
		default:
			return refused();
	}


}
