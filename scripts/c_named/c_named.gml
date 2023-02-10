function c_named(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;
	var here = c_named;

	switch(func)
	{
		case constructor: // can be remove if not needed
			this.name = args[0];
			this.value = args[1];
			return this;
	
		case get_class_info:
			return ok_class_info([
				prop_string("name"),
				prop_any("value"),
			]);

		case "get_name":
			return ok(this.name);
	
		case "get_value":
			return ok(this.value);

		case destructor: 
			return ok();
	
		case test:
			break;
	
		default:
			return refused();
	}


}
