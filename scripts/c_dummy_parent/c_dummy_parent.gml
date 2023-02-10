function c_dummy_parent(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;

	switch(func)
	{
		case constructor:
			return this;

		case "method1":
			return ok(2*args[0]);
	
		case "method2":
			return ok(2);

		case destructor:
			return ok();
	
		case test:
			break;
	
		default:
			return refused();
	}


}
