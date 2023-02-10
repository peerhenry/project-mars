function c_standards_tester(argument0, argument1, argument2) {
	// Object for the soul purpose of testing the OOP framework
	var func = argument0;
	var this = argument1;
	var args = argument2;

	switch(func)
	{
		case constructor:
			this.o1 = args[0];
			this.o2 = args[1];
			return this;
		
		case destructor:
			instance_destroy(this.o1);
			return ok();

		case "do_something":
			return ok(args[0] + args[1]);
	
		case get_class_info:
			return ok_class_info([
				owned_object("o1", obj_empty), // injected, owned
				borrowed_object("o2", obj_empty), // injected, borrowed
				prop_method("do_something", t_number(), [p_number("a"), p_number("b")])	// method taking two numbers and returning a number
			]);
	
		case test:
			break;
	
		default:
			return refused();
	}


}
