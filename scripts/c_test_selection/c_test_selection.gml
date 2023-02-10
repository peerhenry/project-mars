function c_test_selection(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;
	var here = c_test_selection;

#macro xqwerg_dummy fnew(c_test_selection)

	switch(func)
	{	
		case test:
			test_method(here, "macros can be used to create shit");
			break;
	
		case "macros can be used to create shit":
			var thing = xqwerg_dummy;
			assert_true(instance_exists(thing), "instance exists");
			destroy(thing);
			break;
	
		default:
			return refused();
	}


}
