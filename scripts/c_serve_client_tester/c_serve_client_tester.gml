function c_serve_client_tester(argument0, argument1, argument2) {
	var func = argument0;
	var this = argument1;
	var args = argument2;
	var here = c_serve_client_tester;

	switch(func)
	{
		case constructor:
			return this;

		case destructor: 
			return ok();

		case get_class_info:
			return ok_class_info([
				prop_method("dummy_serve_method", t_string(), [p_integer("p1"), p_number("p2")])
			]);
	
		case get_clients:
			return ok([
				tuple(c_dummy_client, "deppy")
			]);
	
		case "dummy_serve_method":
			var p1 = args[0];
			var p2 = args[1];
			return ok("yoyoyo" + string(p1+p2));
	
		case test:
			break;
	
		default:
			return refused();
	}


}
